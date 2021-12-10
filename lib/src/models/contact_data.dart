

import 'package:blocpracticepattern/src/bloc/contactsbloc/contactbloc_bloc.dart';

import 'contacts.dart';

class ContactData {
  static final ContactData _contactData = ContactData._singleton();
  List<Contacts> contactList = [];
  List<Contacts> group1 = [];
  List<Contacts> group2 = [];
  List<Contacts> group3 = [];
  List<Contacts> group4 = [];
  int tabIndex = 0;
  Map<int, SortState> sortSelection = {
    0: SortState.none,
    1: SortState.none,
    2: SortState.none,
    3: SortState.none,
    4: SortState.none,
  };
  factory ContactData() {
    return _contactData;
  }

  ContactData._singleton();
}
