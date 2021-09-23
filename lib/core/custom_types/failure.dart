import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final Exception? innerException;
  final String error;
  final String? errorCod;

  const Failure({required this.error, this.errorCod, this.innerException});

  @override
  List<Object> get props => [error];
}
