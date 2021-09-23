import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/core/models/person.model.dart';
import 'package:wk/core/usecases/update_person.usecase.dart';

import 'update_person.usecase_test.mocks.dart';

@GenerateMocks([IPersonRepository])
void main() {
  late UpdatePersonUseCase updatePersonUseCase;
  late MockIPersonRepository repository;

  setUp(() {
    repository = MockIPersonRepository();
    updatePersonUseCase = UpdatePersonUseCase(repository);
  });

  final birthDate = DateTime.now();

  final updatePersonUseCaseInput = UpdatePersonUseCaseInput(
    id: PersonId("id"),
    address: 'addressEdt.text updated',
    birthDate: birthDate,
    name: 'nameEdt.text updated',
    sex: 'genderSelected.value updated',
    picture: 'photo.value!.path updated',
  );

  final updatedPerson = Person(
    id: PersonId("id"),
    address: 'addressEdt.text updated',
    birthDate: birthDate,
    name: 'nameEdt.text updated',
    sex: 'genderSelected.value updated',
    picture: 'photo.value!.path updated',
  );

  final Future<Either<Failure, Person>> returnedPerson = Future.value(Right(updatedPerson));

  test('should update a Person', () async {
    //arrange
    when(repository.updatePerson(any)).thenAnswer((_) async => returnedPerson);

    //actions
    final updatePersonResult = await updatePersonUseCase(updatePersonUseCaseInput);

    //assertions
    expect(updatePersonResult, Right(updatedPerson));

    verify(repository.updatePerson(any));
    verifyNoMoreInteractions(repository);
  });
  test('should return a failure', () async {
    //arranje
    const failure = Failure(error: 'UnknownFailure');
    final Future<Either<Failure, Person>> wrongAnswer = Future.value(const Left(failure));

    when(repository.updatePerson(any)).thenAnswer((_) async => wrongAnswer);

    //actions
    final result = await updatePersonUseCase(updatePersonUseCaseInput);

    //assertions
    expect(result, const Left(failure));
  });
}
