// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:blocpracticepattern/src/bloc/contactsbloc/contactbloc_bloc.dart';
import 'package:blocpracticepattern/src/bloc/sort/bloc/sort_bloc.dart';
import 'package:blocpracticepattern/src/constants/contants.dart';
import 'package:blocpracticepattern/src/models/contact_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortBottomsheet extends StatefulWidget {
  final ContactblocBloc contactblocBloc;
  ContactData contactData = ContactData();

  SortBottomsheet({Key? key, required this.contactblocBloc}) : super(key: key);

  @override
  _SortBottomsheet createState() => _SortBottomsheet();
}

class _SortBottomsheet extends State<SortBottomsheet> {
  final SortBloc sortBloc = SortBloc();
  SortState sortState = SortState.none;
  @override
  void initState() {
    super.initState();
    sortBloc.add(SortInitial(widget.contactData.tabIndex));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sortBloc,
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<SortBloc, SortState>(
              builder: (context, state) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          Constants.sorting,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () {
                            widget.contactblocBloc.add(SortContacts(
                                state, widget.contactData.tabIndex));
                            Navigator.pop(context);
                          },
                          child: const Text(Constants.done),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 10.0,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          Constants.alphabets,
                          style: TextStyle(fontSize: 15.0),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 15.0),
                          ),
                          onPressed: () {
                            sortBloc.add(Sortselection(
                                SortState.atoZ, widget.contactData.tabIndex));
                          },
                          child: Text(
                            Constants.atoZ,
                            style: TextStyle(
                                color: state == SortState.atoZ
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 15.0),
                          ),
                          onPressed: () {
                            sortBloc.add(Sortselection(
                                SortState.ztoA, widget.contactData.tabIndex));
                          },
                          child: Text(
                            Constants.ztoA,
                            style: TextStyle(
                                color: state == SortState.ztoA
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 10.0,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          Constants.userid,
                          style: TextStyle(fontSize: 15.0),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 15.0),
                          ),
                          onPressed: () {
                            sortBloc.add(Sortselection(
                                SortState.asc, widget.contactData.tabIndex));
                          },
                          child: Text(
                            Constants.asc,
                            style: TextStyle(
                                color: state == SortState.asc
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 15.0),
                          ),
                          onPressed: () {
                            sortBloc.add(Sortselection(
                                SortState.dsc, widget.contactData.tabIndex));
                          },
                          child: Text(
                            Constants.dsc,
                            style: TextStyle(
                                color: state == SortState.dsc
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 10.0,
                      thickness: 2,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
