import 'package:blocpracticepattern/src/bloc/contactsbloc/contactbloc_bloc.dart';

import 'package:blocpracticepattern/src/models/contact_data.dart';
import 'package:blocpracticepattern/src/models/contacts.dart';
import 'package:blocpracticepattern/src/pages/contacts_list.dart';
import 'package:blocpracticepattern/src/pages/sortbottomsheetpage.dart';
import 'package:blocpracticepattern/src/pages/themepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/contants.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  ContactData contactData = ContactData();

  ContactblocBloc contactblocBloc = ContactblocBloc();
  List<Contacts> contactval = [];
  late TabController tabController;

  @override
  void initState() {
    contactblocBloc.add(FetchContactData());
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      contactData.tabIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => contactblocBloc,
      child: Scaffold(
        body: BlocBuilder<ContactblocBloc, ContactblocState>(
            builder: (context, state) {
          if (state is Contactblocloading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ContactFetchData) {
            return DefaultTabController(
              child: Scaffold(
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ThemePage(),
                        ));
                      },
                    )
                  ],
                  title: const Text(Constants.apptitle),
                  bottom: TabBar(
                    controller: tabController,
                    tabs: [
                      for (int i = 1; i <= 4; i++)
                        Tab(
                          text: Constants.tabname + '$i',
                          key: ValueKey("group$i"),
                        ),
                    ],
                  ),
                ),
                body: TabBarView(
                  controller: tabController,
                  children: [
                    ContactList(listofContacts: contactData.group1),
                    ContactList(listofContacts: contactData.group2),
                    ContactList(listofContacts: contactData.group3),
                    ContactList(
                      listofContacts: contactData.group4,
                    ),
                  ],
                ),
              ),
              length: 4,
              initialIndex: 0,
            );
          } else if (state is ContactError) {
            return const Text(Constants.loadingerror);
          } else {
            return const Text(Constants.error);
          }
        }),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.sort),
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  context: context,
                  builder: (context) {
                    return SortBottomsheet(
                      contactblocBloc: contactblocBloc,
                    );
                  });
            }),
      ),
    );
  }
}
