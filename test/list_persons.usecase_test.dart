import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/core/models/person.model.dart';
import 'package:wk/core/usecases/list_all_persons.usecase.dart';

import 'list_persons.usecase_test.mocks.dart';

@GenerateMocks([IPersonRepository])
void main() {
  late ListAllPersonUseCase listAllPersonsUseCase;
  late MockIPersonRepository repository;

  setUp(() {
    repository = MockIPersonRepository();
    listAllPersonsUseCase = ListAllPersonUseCase(repository);
  });

  test('should return a list of all Persons in the repository', () async {
    //arrange
    final List<Person> personList = [
      Person(id: const PersonId('1')),
      Person(id: const PersonId('2')),
      Person(id: const PersonId('3')),
    ];

    final Future<Either<Failure, List<Person>>> response = Future.value(Right(personList));

    when(repository.listPersons()).thenAnswer((_) async => response);

    //actions
    final listAllPersonsResult = await listAllPersonsUseCase.call();

    //assertions
    expect(listAllPersonsResult, Right(personList));

    verify(repository.listPersons());
    verifyNoMoreInteractions(repository);
  });

  test('should return an unknown failure', () async {
    //arrange
    const failure = Failure(error: 'UnknownFailure');
    final failureResponse = Future.value(const Left<Failure, List<Person>>(failure));

    when(repository.listPersons()).thenAnswer((_) async => failureResponse);

    //actions
    final listAllPersonsResult = await listAllPersonsUseCase.call();

    //assertions
    expect(listAllPersonsResult, const Left(failure));

    verify(repository.listPersons());
    verifyNoMoreInteractions(repository);
  });
}
