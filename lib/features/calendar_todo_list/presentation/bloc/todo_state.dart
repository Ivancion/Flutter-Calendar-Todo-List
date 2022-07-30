import 'package:calendar_todo_list/features/calendar_todo_list/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<Todo> tasks;

  const TodoState(this.tasks);

  const TodoState.initial() : tasks = const <Todo>[];

  @override
  List<Object?> get props => [tasks];

  TodoState copyWith({
    List<Todo>? tasks,
  }) {
    return TodoState(
      tasks ?? this.tasks,
    );
  }
}
