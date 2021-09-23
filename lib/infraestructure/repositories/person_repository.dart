import 'package:wk/core/custom_types/nothing.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/core/models/person.model.dart';
import 'package:wk/infraestructure/gateways/db_provider.dart';

class PersonRepository implements IPersonRepository {
  @override
  Future<Either<Failure, Person>> createPerson(Person person) async {
    return DBProvider.db.newPerson(person);
  }

  @override
  Future<Either<Failure, Nothing>> deletePerson(PersonId personId) {
    return DBProvider.db.deletePerson(int.parse(personId.value));
  }

  @override
  Future<Either<Failure, List<Person>>> listPersons() async {
    return DBProvider.db.getAllPersons();
  }

  @override
  Future<Either<Failure, Person>> updatePerson(Person person) {
    return DBProvider.db.updatePerson(person);
  }
}
