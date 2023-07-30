part of 'contact_bloc.dart';

@immutable
abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class LoadedContactState extends ContactState {
  final List<ContactModel> contact;

  LoadedContactState({required this.contact});
  @override
  List<Object> get props => [contact];
}

class LoadingContactState extends ContactState {}

class FailureContactState extends ContactState {
  final String error;

  FailureContactState({required this.error});
  @override
  List<Object> get props => [error];
}
