import 'package:calendar_todo_list/core/usecases/stream_usecase.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/entities/todo.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/repositories/todo_repository.dart';
import 'package:equatable/equatable.dart';

class GetTodos implements StreamUseCase<List<Todo>, WatchParams> {
  final TodoRepository repository;

  const GetTodos(this.repository);

  @override
  Stream<List<Todo>> call(WatchParams params) {
    return repository.watchTodos(params.date);
  }
}

class WatchParams extends Equatable {
  final DateTime date;

  const WatchParams(this.date);

  @override
  List<Object?> get props => [date];
}
