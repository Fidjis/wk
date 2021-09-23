import 'package:dartz/dartz.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/custom_types/nothing.dart';
import 'package:wk/core/models/person.model.dart';

abstract class IPersonRepository {
  Future<Either<Failure, Person>> createPerson(Person person);
  Future<Either<Failure, List<Person>>> listPersons();
  Future<Either<Failure, Person>> updatePerson(Person person);
  Future<Either<Failure, Nothing>> deletePerson(PersonId personId);
}
