import 'dart:convert';

import 'package:bloc_excercise/model/contact_model.dart';
import 'package:http/http.dart' as http;

class ContactRepository {
  final String url = 'https://healthy-rose-hippopotamus.cyclic.app/contact';

  Future<List<ContactModel>> getContact() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<ContactModel> contacts = (jsonDecode(response.body) as List)
            .map((e) =>
                ContactModel(id: e['id'], name: e['name'], phone: e['phone']))
            .toList();

        return contacts;
      } else {
        throw Exception('failed to load contact');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postContact(ContactModel contact) async {
    try {
      await http.post(Uri.parse(url), body: contact.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
