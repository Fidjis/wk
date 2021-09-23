import 'package:wk/core/custom_types/entity.dart';
import 'package:wk/core/custom_types/id.dart';

class Person extends Entity<PersonId> {
  String? name;
  DateTime? birthDate;
  String? sex;
  String? address;
  String? picture;

  Person({
    this.name,
    this.birthDate,
    this.sex,
    this.address,
    this.picture,
    PersonId? id,
  }) : super(id);

  factory Person.fromMap(Map<String, dynamic> json) => new Person(
        id: PersonId(json["id"].toString()),
        name: json["name"],
        birthDate: DateTime.parse(json["birthDate"]),
        sex: json["sex"],
        address: json["address"],
        picture: json["picture"],
      );

  Map<String, dynamic> toMap() => {
        "id": id?.value,
        "name": name,
        "birthDate": birthDate.toString(),
        "sex": sex,
        "address": address,
        "picture": picture,
      };
}

class PersonId extends Id<PersonId> {
  const PersonId(String value) : super(value, const IdValidator<String>());
}
