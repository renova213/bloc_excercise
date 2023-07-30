import 'package:bloc_excercise/bloc/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
        () => BlocProvider.of<ContactBloc>(context).add(GetContact()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Contact '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            if (state is ContactLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ContactLoad) {
              return ListView.builder(
                itemCount: state.contacts.length,
                itemBuilder: (context, index) {
                  final data = state.contacts[index];
                  return ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<ContactBloc>()
                              .add(DeleteContact(index: index));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Contact Berhasil Dihapus")),
                          );
                        },
                        icon: const Icon(Icons.delete)),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green),
                      alignment: Alignment.center,
                      child: Text(data.name[0].toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    title: Text(
                      data.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(data.phone),
                  );
                },
              );
            } else if (state is ContactFailed) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
