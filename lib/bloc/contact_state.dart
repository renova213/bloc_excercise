part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactLoading extends ContactState {}

class ContactFailed extends ContactState {
  final String message;
  const ContactFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class ContactLoad extends ContactState {
  final List<ContactModel> contacts;

  const ContactLoad({required this.contacts});

  @override
  List<Object> get props => [contacts];
}
