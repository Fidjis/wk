import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'nothing.dart';

abstract class SelfValidator {
  Either<Failure, Nothing> validate();
}
