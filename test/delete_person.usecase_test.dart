import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/custom_types/nothing.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/core/models/person.model.dart';
import 'package:wk/core/usecases/delete_person.usecase.dart';

import 'delete_person.usecase_test.mocks.dart';

@GenerateMocks([IPersonRepository])
void main() {
  late DeletePersonUseCase deletePersonUseCase;
  late MockIPersonRepository repository;

  setUp(() {
    repository = MockIPersonRepository();
    deletePersonUseCase = DeletePersonUseCase(repository);
  });

  const personId = PersonId('1');

  test('should delete Person by id', () async {
    //arrange
    when(repository.deletePerson(
      any,
    )).thenAnswer((_) async => const Right(Nothing()));

    //actions
    final deletedPersonResponse = await deletePersonUseCase(personId);

    //assertions
    expect(deletedPersonResponse.isRight(), true);

    verify(repository.deletePerson(any));
    verifyNoMoreInteractions(repository);
  });

  test('should return a PersonNotFoundFailure when the Person doesnt exists in repository', () async {
    //arranje
    const failure = Failure(error: 'UnknownFailure');

    when(repository.deletePerson(any)).thenAnswer((_) async => const Left(failure));

    //actions
    final result = await deletePersonUseCase.call(personId);

    //assertions
    expect(result, const Left(failure));
  });
}
