import 'package:dartz/dartz.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/custom_types/nothing.dart';
import 'package:wk/core/custom_types/usecase.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/core/models/person.model.dart';

class DeletePersonUseCase implements UseCaseWithInput<PersonId, Nothing> {
  final IPersonRepository _personRepository;

  DeletePersonUseCase(this._personRepository);

  @override
  Future<Either<Failure, Nothing>> call(PersonId id) async {
    final validation = id.validate();

    if (validation.isLeft()) {
      final failure = validation.fold((l) => l, (r) => r) as Failure;
      return Left(failure);
    }

    return _personRepository.deletePerson(id);
  }
}
