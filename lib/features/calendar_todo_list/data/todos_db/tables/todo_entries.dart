import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/tables/dates.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/tables/tasks.dart';
import 'package:drift/drift.dart';

@DataClassName('TodoEntry')
class TodoEntries extends Table {
  DateTimeColumn get taskDate => dateTime().references(Dates, #date)();
  IntColumn get task => integer().references(Tasks, #id)();
}
