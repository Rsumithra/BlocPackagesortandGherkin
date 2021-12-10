// ignore_for_file: must_be_immutable

part of 'contactbloc_bloc.dart';

@immutable
abstract class ContactblocState {}

class ContactblocInitial extends ContactblocState {
  List<Object?> get props => throw UnimplementedError();
}

class Contactblocloading extends ContactblocState {
  List<Object?> get props => throw UnimplementedError();
}

class ContactFetchData extends ContactblocState {}

class ContactError extends ContactblocState {
  String msg;
  ContactError({required this.msg});
}
