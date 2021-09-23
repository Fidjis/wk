import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wk/core/models/person.model.dart';

class PersonTile extends StatelessWidget {
  final Person person;
  final Function onTap;
  final void Function(Person person) edt;
  final void Function(PersonId id) delete;

  const PersonTile({
    Key? key,
    required this.person,
    required this.onTap,
    required this.edt,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              child: person.picture == null
                  ? Container()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        person.picture!,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.blue.withOpacity(0.7),
                          child: Image.file(
                            File(person.picture!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name!,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Nasc.: ${DateFormat('dd-MM-yyyy').format(person.birthDate!)}',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {
                edt(person);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.blue.withOpacity(0.7),
              ),
            ),
            IconButton(
              onPressed: () {
                delete(person.id!);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.blue.withOpacity(0.7),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
