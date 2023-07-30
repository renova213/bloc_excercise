import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_excercise/repositories/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepo contactRepo;
  ContactBloc(this.contactRepo) : super(LoadingContactState()) {
    on<ContactEvent>((event, emit) {
      on<LoadContactEvent>((event, emit) async {
        emit(LoadingContactState());
        try {
          final List<ContactModel> contact = await contactRepo.getContact();
          {
            emit(LoadedContactState(contact: contact));
          }
        } catch (e) {
          emit(FailureContactState(error: e.toString()));
        }
      });
      on<AddContactEvent>(_addContact);
      on<DeleteContactEvent>(_deleteContact);
      on<UpdateContactEvent>(_updateContact);
    });
  }

  Future<void> _addContact(
      AddContactEvent event, Emitter<ContactState> emit) async {}

  Future<void> _deleteContact(
      DeleteContactEvent event, Emitter<ContactState> emit) async {}

  Future<void> _updateContact(
      UpdateContactEvent event, Emitter<ContactState> emit) async {}
}
