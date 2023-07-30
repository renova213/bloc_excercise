part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class CreateContact extends ContactEvent {
  final ContactModel contact;

  const CreateContact({required this.contact});

  @override
  List<Object> get props => [contact];
}

class GetContact extends ContactEvent {}

class UpdateContact extends ContactEvent {
  final int index;
  final ContactModel contact;

  const UpdateContact({required this.contact, required this.index});

  @override
  List<Object> get props => [contact, index];
}

class DeleteContact extends ContactEvent {
  final int index;

  const DeleteContact({required this.index});

  @override
  List<Object> get props => [index];
}
