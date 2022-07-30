import 'dart:io';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/daos/todos_dao.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/tables/dates.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/tables/tasks.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/tables/todo_entries.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'todos_database.g.dart';

@DriftDatabase(daos: [TodosDao], tables: [Tasks, Dates, TodoEntries])
class TodosDatabase extends _$TodosDatabase {
  TodosDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}
