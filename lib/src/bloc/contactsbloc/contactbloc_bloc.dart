import 'package:bloc/bloc.dart';
import 'package:blocpracticepattern/src/constants/contants.dart';
import 'package:blocpracticepattern/src/models/contact_data.dart';
import 'package:blocpracticepattern/src/models/contacts.dart';
import 'package:blocpracticepattern/src/repository/contactsrespository.dart';

import 'package:meta/meta.dart';

part 'contactbloc_event.dart';
part 'contactbloc_state.dart';

class ContactblocBloc extends Bloc<ContactblocEvent, ContactblocState> {
  late List<Contacts> contactdata;
  ContactData contactDatasingle = ContactData();
  ContactsRespository contactsRespository = ContactsRespository();

  ContactblocBloc() : super(ContactblocInitial()) {
    on<ContactblocEvent>((event, emit) async {
      if (event is FetchContactData) {
        emit(Contactblocloading());
        try {
          contactdata = await contactsRespository.getContacts();
          if (contactdata.isEmpty) {
            emit(ContactError(msg: Constants.nodata));
          } else {
            _subListContacts(
              contactdata,
            );
            emit(ContactFetchData());
          }
        } catch (exception) {
          emit(ContactError(msg: exception.toString()));
        }
      } else if (event is SortContacts) {
        _sortcontacts(event.sortState, event.tabindex);
        emit(ContactFetchData());
      }
    });
  }
  void _subListContacts(List<Contacts> contacts) {
    contactDatasingle.group1 = contacts.sublist(0, 25);
    contactDatasingle.group2 = contacts.sublist(25, 50);
    contactDatasingle.group3 = contacts.sublist(50, 75);
    contactDatasingle.group4 = contacts.sublist(75);
  }

  void _sortcontacts(SortState sortState, int tabindex) {
    List<Contacts> contacts = getContactsdata(tabindex);
    if (sortState == SortState.atoZ) {
      contacts.sort((a, b) => a.name.compareTo(b.name));
    } else if (sortState == SortState.ztoA) {
      contacts.sort((a, b) => b.name.compareTo(a.name));
    } else if (sortState == SortState.asc) {
      contacts.sort((a, b) => a.contacts.compareTo(b.contacts));
    } else if (sortState == SortState.dsc) {
      contacts.sort((a, b) => b.contacts.compareTo(a.contacts));
    }
    setContactsIndex(contacts, tabindex);
  }

  void setContactsIndex(List<Contacts> contacts, int tabIndex) {
    switch (tabIndex) {
      case 0:
        contactDatasingle.group1 = contacts;
        break;
      case 1:
        contactDatasingle.group2 = contacts;
        break;

      case 2:
        contactDatasingle.group3 = contacts;
        break;

      default:
        contactDatasingle.group4 = contacts;
    }
  }

  List<Contacts> getContactsdata(int tabindex) {
    switch (tabindex) {
      case 0:
        return contactDatasingle.group1;

      case 1:
        return contactDatasingle.group2;

      case 2:
        return contactDatasingle.group3;

      default:
        return contactDatasingle.group4;
    }
  }
}
