abstract class TodoEvent {}

class LoadTodosEvent extends TodoEvent {}

class SaveTodoEvent extends TodoEvent {
  final String task;
  final int hour;
  final int minute;

  SaveTodoEvent({
    required this.task,
    required this.hour,
    required this.minute,
  });
}

class DeleteTodoEvent extends TodoEvent {
  final int id;

  DeleteTodoEvent({
    required this.id,
  });
}
