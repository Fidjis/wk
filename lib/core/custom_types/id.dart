import 'package:dartz/dartz.dart';
import 'package:wk/core/custom_types/validator.dart';

import 'failure.dart';
import 'nothing.dart';
import 'value_object.dart';

abstract class Id<Entity> extends ValueObject<String> {
  const Id(String value, IdValidator<String> validator) : super(value: value, validator: validator);
}

class IdValidator<T> implements Validator<T> {
  const IdValidator();

  @override
  Either<Failure, Nothing> validate(T value) {
    final isEmpty = value.toString() == '' || value == null;

    if (isEmpty) {
      return const Left(Failure(error: 'INVALID.ID.EMPTY'));
    }

    return const Right(Nothing());
  }
}
