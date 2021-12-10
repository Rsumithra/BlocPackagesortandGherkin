part of 'sort_bloc.dart';

abstract class SortEvent {}

class Sortselection extends SortEvent {
  final SortState sortState;
  final int tabindex;
  Sortselection(this.sortState, this.tabindex);
}

class SortInitial extends SortEvent {
  final int tabindex;
  SortInitial(this.tabindex);
}
