import 'package:dartz/dartz.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/custom_types/nothing.dart';
import 'package:wk/core/custom_types/self_validator.dart';
import 'package:wk/core/custom_types/usecase.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/core/models/person.model.dart';

class UpdatePersonUseCase implements UseCaseWithInput<UpdatePersonUseCaseInput, Person> {
  final IPersonRepository _personRepository;

  UpdatePersonUseCase(this._personRepository);

  @override
  Future<Either<Failure, Person>> call(
    UpdatePersonUseCaseInput input,
  ) async {
    final validation = input.validate();

    if (validation.isLeft()) {
      final failure = validation.fold((l) => l, (r) => r) as Failure;
      return Left(failure);
    }

    final person = Person(
      name: input.name,
      address: input.address,
      birthDate: input.birthDate,
      id: input.id,
      picture: input.picture,
      sex: input.sex,
    );

    return _personRepository.updatePerson(person);
  }
}

class UpdatePersonUseCaseInput implements SelfValidator {
  final PersonId id;
  final String? name;
  final DateTime? birthDate;
  final String? sex;
  final String? address;
  final String? picture;

  UpdatePersonUseCaseInput({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.sex,
    required this.address,
    required this.picture,
  });

  @override
  Either<Failure, Nothing> validate() {
    final validate = id.validate();
    if (validate.isLeft()) {
      if (name!.isEmpty) {
        return const Left(Failure(error: 'ID.CANOT.BE.NULL'));
      }
    }
    if (name == null) {
      if (name!.isEmpty) {
        return const Left(Failure(error: 'NAME.CANOT.BE.NULL'));
      }
    }
    if (address == null) {
      if (address!.isEmpty) {
        return const Left(Failure(error: 'ADDRESS.CANOT.BE.NULL'));
      }
    }
    return const Right(Nothing());
  }
}
