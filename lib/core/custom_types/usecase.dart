import 'package:dartz/dartz.dart';

import 'failure.dart';

abstract class UseCaseWithInput<InputT, OutputT> {
  Future<Either<Failure, OutputT>> call(InputT input);
}

abstract class UseCaseWithoutInput<OutputT> {
  Future<Either<Failure, OutputT>> call();
}
