import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'nothing.dart';

abstract class Validator<T> {
  Either<Failure, Nothing> validate(T value);
}
