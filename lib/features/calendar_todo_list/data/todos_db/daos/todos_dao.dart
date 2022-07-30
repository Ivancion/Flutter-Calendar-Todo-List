import 'package:calendar_todo_list/features/calendar_todo_list/data/models/todo_model.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/database/todos_database.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/tables/dates.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/tables/tasks.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/tables/todo_entries.dart';
import 'package:drift/drift.dart';

part 'todos_dao.g.dart';

@DriftAccessor(tables: [Dates, Tasks, TodoEntries])
class TodosDao extends DatabaseAccessor<TodosDatabase> with _$TodosDaoMixin {
  TodosDao(TodosDatabase db) : super(db);

  Future<void> saveTodo(DateTime date, String task) {
    return transaction(() async {
      final dateForDatesTable = DateTime(date.year, date.month, date.day);

      final taskRow = await into(tasks).insertReturning(
        TasksCompanion(
          name: Value(task),
          hour: Value(date.hour),
          minute: Value(date.minute),
        ),
      );

      await into(dates).insert(
        DatesCompanion(date: Value(dateForDatesTable)),
        mode: InsertMode.insertOrIgnore,
      );

      await into(todoEntries)
          .insert(TodoEntry(taskDate: dateForDatesTable, task: taskRow.id));
    });
  }

  Stream<List<TodoModel>> watchTodos(DateTime date) {
    final tasksQuery = select(todoEntries).join(
      [
        innerJoin(
          tasks,
          tasks.id.equalsExp(todoEntries.task),
        )
      ],
    )..where(todoEntries.taskDate.equals(date));

    final tasksStream = tasksQuery.watch().map((rows) {
      return rows.map((row) => row.readTable(tasks)).toList();
    });

    return tasksStream.map((tasks) {
      return List.generate(tasks.length, (index) {
        final fullDate = DateTime(
          date.year,
          date.month,
          date.day,
          tasks[index].hour,
          tasks[index].minute,
        );
        return TodoModel(
          id: tasks[index].id,
          date: fullDate,
          taskName: tasks[index].name,
        );
      });
    });
  }

  Future<void> deleteTodo(int id) {
    return transaction(() async {
      await (delete(todoEntries)..where((tbl) => tbl.task.equals(id))).go();

      await (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
    });
  }
}
