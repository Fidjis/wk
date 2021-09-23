// Mocks generated by Mockito 5.0.16 from annotations
// in wk/test/create_person_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:wk/core/custom_types/failure.dart' as _i5;
import 'package:wk/core/custom_types/nothing.dart' as _i7;
import 'package:wk/core/interfaces/i_person.repository.dart' as _i3;
import 'package:wk/core/models/person.model.dart' as _i6;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [IPersonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPersonRepository extends _i1.Mock implements _i3.IPersonRepository {
  MockIPersonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Person>> createPerson(
          _i6.Person? person) =>
      (super.noSuchMethod(Invocation.method(#createPerson, [person]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Person>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Person>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Person>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Person>>> listPersons() =>
      (super.noSuchMethod(Invocation.method(#listPersons, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.Person>>>.value(
              _FakeEither_0<_i5.Failure, List<_i6.Person>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.Person>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Person>> updatePerson(
          _i6.Person? person) =>
      (super.noSuchMethod(Invocation.method(#updatePerson, [person]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Person>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Person>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Person>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.Nothing>> deletePerson(
          _i6.PersonId? personId) =>
      (super.noSuchMethod(Invocation.method(#deletePerson, [personId]),
              returnValue: Future<_i2.Either<_i5.Failure, _i7.Nothing>>.value(
                  _FakeEither_0<_i5.Failure, _i7.Nothing>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i7.Nothing>>);
  @override
  String toString() => super.toString();
}