import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/custom_types/nothing.dart';
import 'package:wk/core/models/person.model.dart';

class DBProvider {
  DBProvider._();

  static late DBProvider db = DBProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DB03.db");
    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Person ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "birthDate TEXT,"
          "address TEXT,"
          "picture TEXT,"
          "sex TEXT"
          ")");
    });
  }

  Future<Either<Failure, Person>> newPerson(Person newPerson) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Person");
    int id = table.first["id"] != null ? table.first["id"] as int : 0;

    var row = await db.rawInsert(
        "INSERT Into Person (id,name,birthDate,address, picture, sex)"
        " VALUES (?,?,?,?,?,?)",
        [id, newPerson.name, newPerson.birthDate.toString(), newPerson.address, newPerson.picture, newPerson.sex]);

    if (row != 0) {
      return Right(newPerson);
    } else {
      return Left(Failure(error: row.toString()));
    }
  }

  Future<Either<Failure, Person>> updatePerson(Person person) async {
    final db = await database;
    var res = await db.update("Person", person.toMap(), where: "id = ?", whereArgs: [person.id!.value]);

    if (res != 0) {
      return Right(Person());
    } else {
      return Left(Failure(error: res.toString()));
    }
  }

  Future<Either<Failure, List<Person>>> getAllPersons() async {
    final db = await database;
    var res = await db.query("Person");
    List<Person> list = res.isNotEmpty ? res.map((c) => Person.fromMap(c)).toList() : [];
    return Right(list);
  }

  Future<Either<Failure, Nothing>> deletePerson(int id) async {
    final db = await database;
    final row = await db.delete("Person", where: "id = ?", whereArgs: [id]);

    if (row != 0) {
      return Right(Nothing());
    } else {
      return Left(Failure(error: row.toString()));
    }
  }
}
