class ContactModel {
  int id;
  String name;
  String phone;

  ContactModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
      };
}
