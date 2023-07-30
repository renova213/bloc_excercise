// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:bloc_excercise/model/contact_model.dart';
import 'package:bloc_excercise/repositories/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

final ContactRepository contactRepository = ContactRepository();

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactLoading()) {
    on<GetContact>(_getContact);
    on<CreateContact>(_createContact);
    on<UpdateContact>(_updateContact);
    on<DeleteContact>(_deleteContact);
  }

  Future<void> _getContact(GetContact event, Emitter<ContactState> emit) async {
    emit(ContactLoading());

    try {
      final List<ContactModel> contacts = await contactRepository.getContact();
      emit(ContactLoad(contacts: contacts));
    } catch (e) {
      emit(ContactFailed(message: e.toString()));
    }
  }

  Future<void> _createContact(
      CreateContact event, Emitter<ContactState> emit) async {
    final state = this.state;

    if (state is ContactLoad) {
      final currentContact = state.contacts;
      currentContact.add(event.contact);
      emit(ContactLoad(contacts: currentContact));
    }
  }

  Future<void> _updateContact(
      UpdateContact event, Emitter<ContactState> emit) async {
    final state = this.state;

    if (state is ContactLoad) {
      final currentContact = state.contacts;
      currentContact.removeAt(event.index);
      currentContact.add(event.contact);

      emit(ContactLoad(contacts: currentContact));
    }
  }

  Future<void> _deleteContact(
      DeleteContact event, Emitter<ContactState> emit) async {
    final state = this.state;

    if (state is ContactLoad) {
      final currentContact = state.contacts;
      currentContact.removeAt(event.index);

      emit(ContactLoad(contacts: currentContact));
    }
  }
}
