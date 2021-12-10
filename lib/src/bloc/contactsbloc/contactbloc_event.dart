part of 'contactbloc_bloc.dart';

enum SortState { atoZ, ztoA, asc, dsc, none }
abstract class ContactblocEvent {}


class FetchContactData extends ContactblocEvent {}

class SortContacts extends ContactblocEvent{
  final SortState sortState;
  int tabindex;
  SortContacts(this.sortState,this.tabindex);

}

