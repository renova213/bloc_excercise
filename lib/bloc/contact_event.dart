part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class LoadContactEvent extends ContactEvent {
  @override
  List<Object> get props => [];
}

class AddContactEvent extends ContactEvent {
  final List<ContactModel> contact;

  AddContactEvent({required this.contact});
  @override
  List<Object> get props => [contact];
}

class UpdateContactEvent extends ContactEvent {
  final int index;
  final ContactModel contact;
  UpdateContactEvent({required this.index, required this.contact});
  @override
  List<Object> get props => [index, contact];
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  DeleteContactEvent({required this.index});
  @override
  List<Object> get props => [index];
}
