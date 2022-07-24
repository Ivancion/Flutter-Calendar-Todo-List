import 'package:calendar_todo_list/core/error/failures.dart';
import 'package:calendar_todo_list/core/usecases/stream_usecase.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/entities/todo.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class WatchTodos implements StreamUseCase<Todo, Params> {
  final TodoRepository repository;

  const WatchTodos(this.repository);

  @override
  Stream<Either<Failure, Todo>> call(Params params) {
    return repository.watchTodos(params.date);
  }
}

class Params extends Equatable {
  final DateTime date;

  const Params(this.date);

  @override
  List<Object?> get props => [date];
}
