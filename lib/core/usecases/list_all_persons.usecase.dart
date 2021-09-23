import 'package:dartz/dartz.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/custom_types/usecase.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/core/models/person.model.dart';

class ListAllPersonUseCase implements UseCaseWithoutInput<List<Person>> {
  final IPersonRepository _personRepository;

  ListAllPersonUseCase(this._personRepository);

  @override
  Future<Either<Failure, List<Person>>> call() async {
    return _personRepository.listPersons();
  }
}
