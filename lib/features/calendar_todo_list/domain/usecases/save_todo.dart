import 'package:calendar_todo_list/core/usecases/future_usecase.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/repositories/todo_repository.dart';
import 'package:equatable/equatable.dart';

class SaveTodo implements FutureUseCase<void, SaveParams> {
  final TodoRepository repository;

  const SaveTodo(this.repository);

  @override
  Future<void> call(SaveParams params) async {
    return await repository.saveTodo(date: params.date, task: params.task);
  }
}

class SaveParams extends Equatable {
  final DateTime date;
  final String task;

  const SaveParams(this.date, this.task);

  @override
  List<Object?> get props => [date, task];
}
