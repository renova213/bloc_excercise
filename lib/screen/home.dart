import 'package:bloc_excercise/bloc/contact_bloc.dart';
import 'package:bloc_excercise/model/contact.dart';
import 'package:bloc_excercise/repositories/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(
        ContactRepo(),
      )..add(LoadContactEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CRUD Contact '),
        ),
        body: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            if (state is LoadingContactState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedContactState) {
              return ListView.builder(
                itemCount: state.contact.length,
                itemBuilder: (context, index) {
                  ContactModel contact = state.contact[index];
                  return ListTile(
                    title: Text(contact.name),
                  );
                },
              );
            } else if (state is FailureContactState) {
              return Center(
                child: Text(state.error),
              );
            }
            return Center();
          },
        ),
      ),
    );
  }
}
