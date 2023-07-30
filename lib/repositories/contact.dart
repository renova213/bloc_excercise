import 'dart:convert';

import 'package:bloc_excercise/model/contact.dart';
import 'package:http/http.dart' as http;

class ContactRepo {
  final String url = 'https://healthy-rose-hippopotamus.cyclic.app/contact';

  Future<List<ContactModel>> getContact() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> contact = json.decode(response.body);
      print(contact);
      return contact.map((item) => ContactModel.fromJson(item)).toList();
    } else {
      throw Exception('failed to load contact');
    }
  }

  Future postContact(String name, phone) async {
    final data = {
      'name': name,
      'phone': phone,
    };
    final response = await http.post(Uri.parse(url));

    final body = jsonDecode(response.body);
    return response;
  }
}
