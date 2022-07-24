import 'package:calendar_todo_list/core/error/failures.dart';
import 'package:calendar_todo_list/core/usecases/future_usecase.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SaveTodo implements FutureUseCase<void, Params> {
  final TodoRepository repository;

  const SaveTodo(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.saveTodo(date: params.date, task: params.task);
  }
}

class Params extends Equatable {
  final DateTime date;
  final String task;

  const Params(this.date, this.task);

  @override
  List<Object?> get props => [date, task];
}
