import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'failure.dart';
import 'nothing.dart';
import 'self_validator.dart';
import 'validator.dart';

abstract class ValueObject<T> extends Equatable implements SelfValidator {
  final T value;

  @protected
  final Validator<T> validator;

  const ValueObject({required this.value, required this.validator});

  @override
  Either<Failure, Nothing> validate() {
    return validator.validate(value);
  }

  @Deprecated('For ValueObjects use `.value` instead')
  @override
  String toString() {
    return value.toString();
  }

  @override
  List<T> get props => [value];
}
