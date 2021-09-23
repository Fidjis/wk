import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wk/core/custom_types/failure.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/core/models/person.model.dart';
import 'package:wk/core/usecases/create_person.usecase.dart';

import 'create_person_use_case_test.mocks.dart';

@GenerateMocks([IPersonRepository])
void main() {
  late CreatePersonUseCase createPersonUseCase;
  late MockIPersonRepository repository;

  setUp(() {
    repository = MockIPersonRepository();
    createPersonUseCase = CreatePersonUseCase(repository);
  });

  final birthDate = DateTime.now();

  final input = CreatePersonUseCaseInput(
    address: 'addressEdt.text',
    birthDate: birthDate,
    name: 'nameEdt.text',
    sex: 'genderSelected.value',
    picture: 'photo.value!.path',
  );

  final createdPerson = Person(
    id: PersonId("id"),
    address: 'addressEdt.text',
    birthDate: birthDate,
    name: 'nameEdt.text',
    sex: 'genderSelected.value',
    picture: 'photo.value!.path',
  );

  test('should create a Person entity', () async {
    //arranje
    when(repository.createPerson(any)).thenAnswer((_) async => Right(createdPerson));

    //actions
    final result = await createPersonUseCase.call(input);

    //assertions
    expect(result, Right(createdPerson));
  });

  test('should return a Person already exists failure', () async {
    //arranje
    const failure = Failure(error: 'UnknownFailure');

    when(repository.createPerson(any)).thenAnswer((_) async => const Left(failure));

    //actions
    final result = await createPersonUseCase.call(input);

    //assertions
    expect(result, const Left(failure));
  });
}
