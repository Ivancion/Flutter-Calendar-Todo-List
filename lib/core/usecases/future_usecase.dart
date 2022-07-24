import 'package:calendar_todo_list/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FutureUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
