import 'package:bloc/bloc.dart';
import 'package:blocpracticepattern/src/bloc/contactsbloc/contactbloc_bloc.dart';
import 'package:blocpracticepattern/src/models/contact_data.dart';

part 'sort_event.dart';

class SortBloc extends Bloc<SortEvent, SortState> {
  ContactData contactData = ContactData();
  SortBloc() : super(SortState.none) {
    on<SortEvent>((event, emit) {
      if (event is Sortselection) {
        contactData.sortSelection[event.tabindex] = event.sortState;
        emit(event.sortState);
      } else if (event is SortInitial) {
        emit(contactData.sortSelection[event.tabindex] ?? SortState.none);
      }
    });
  }
}
