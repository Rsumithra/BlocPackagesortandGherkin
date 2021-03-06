import 'package:blocpracticepattern/src/constants/contants.dart';
import 'package:blocpracticepattern/src/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Contacts> listofContacts;

  const ContactList({Key? key, required this.listofContacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
          key: const ValueKey('contactListView'),
          itemCount: listofContacts.length,
          itemBuilder: (context, index) {
            Contacts con = listofContacts[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: ListTile(
                title: Text(con.name),
                subtitle: Text(con.contacts),
                trailing: Image.network(Constants.imgurl),
              ),
            );
          }),
    );
  }
}
