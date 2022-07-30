// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String name;
  final int hour;
  final int minute;
  Task(
      {required this.id,
      required this.name,
      required this.hour,
      required this.minute});
  factory Task.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Task(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      hour: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hour'])!,
      minute: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}minute'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['hour'] = Variable<int>(hour);
    map['minute'] = Variable<int>(minute);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      name: Value(name),
      hour: Value(hour),
      minute: Value(minute),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      hour: serializer.fromJson<int>(json['hour']),
      minute: serializer.fromJson<int>(json['minute']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'hour': serializer.toJson<int>(hour),
      'minute': serializer.toJson<int>(minute),
    };
  }

  Task copyWith({int? id, String? name, int? hour, int? minute}) => Task(
        id: id ?? this.id,
        name: name ?? this.name,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, hour, minute);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.name == this.name &&
          other.hour == this.hour &&
          other.minute == this.minute);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> hour;
  final Value<int> minute;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.hour = const Value.absent(),
    this.minute = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int hour,
    required int minute,
  })  : name = Value(name),
        hour = Value(hour),
        minute = Value(minute);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? hour,
    Expression<int>? minute,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (hour != null) 'hour': hour,
      if (minute != null) 'minute': minute,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? hour,
      Value<int>? minute}) {
    return TasksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hour.present) {
      map['hour'] = Variable<int>(hour.value);
    }
    if (minute.present) {
      map['minute'] = Variable<int>(minute.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<int?> hour = GeneratedColumn<int?>(
      'hour', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int?> minute = GeneratedColumn<int?>(
      'minute', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, hour, minute];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('hour')) {
      context.handle(
          _hourMeta, hour.isAcceptableOrUnknown(data['hour']!, _hourMeta));
    } else if (isInserting) {
      context.missing(_hourMeta);
    }
    if (data.containsKey('minute')) {
      context.handle(_minuteMeta,
          minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta));
    } else if (isInserting) {
      context.missing(_minuteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Task.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Date extends DataClass implements Insertable<Date> {
  final DateTime date;
  Date({required this.date});
  factory Date.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Date(
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  DatesCompanion toCompanion(bool nullToAbsent) {
    return DatesCompanion(
      date: Value(date),
    );
  }

  factory Date.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Date(
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Date copyWith({DateTime? date}) => Date(
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Date(')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => date.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Date && other.date == this.date);
}

class DatesCompanion extends UpdateCompanion<Date> {
  final Value<DateTime> date;
  const DatesCompanion({
    this.date = const Value.absent(),
  });
  DatesCompanion.insert({
    required DateTime date,
  }) : date = Value(date);
  static Insertable<Date> custom({
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
    });
  }

  DatesCompanion copyWith({Value<DateTime>? date}) {
    return DatesCompanion(
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatesCompanion(')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $DatesTable extends Dates with TableInfo<$DatesTable, Date> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DatesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [date];
  @override
  String get aliasedName => _alias ?? 'dates';
  @override
  String get actualTableName => 'dates';
  @override
  VerificationContext validateIntegrity(Insertable<Date> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  Date map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Date.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DatesTable createAlias(String alias) {
    return $DatesTable(attachedDatabase, alias);
  }
}

class TodoEntry extends DataClass implements Insertable<TodoEntry> {
  final DateTime taskDate;
  final int task;
  TodoEntry({required this.taskDate, required this.task});
  factory TodoEntry.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TodoEntry(
      taskDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_date'])!,
      task: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task_date'] = Variable<DateTime>(taskDate);
    map['task'] = Variable<int>(task);
    return map;
  }

  TodoEntriesCompanion toCompanion(bool nullToAbsent) {
    return TodoEntriesCompanion(
      taskDate: Value(taskDate),
      task: Value(task),
    );
  }

  factory TodoEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoEntry(
      taskDate: serializer.fromJson<DateTime>(json['taskDate']),
      task: serializer.fromJson<int>(json['task']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskDate': serializer.toJson<DateTime>(taskDate),
      'task': serializer.toJson<int>(task),
    };
  }

  TodoEntry copyWith({DateTime? taskDate, int? task}) => TodoEntry(
        taskDate: taskDate ?? this.taskDate,
        task: task ?? this.task,
      );
  @override
  String toString() {
    return (StringBuffer('TodoEntry(')
          ..write('taskDate: $taskDate, ')
          ..write('task: $task')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(taskDate, task);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoEntry &&
          other.taskDate == this.taskDate &&
          other.task == this.task);
}

class TodoEntriesCompanion extends UpdateCompanion<TodoEntry> {
  final Value<DateTime> taskDate;
  final Value<int> task;
  const TodoEntriesCompanion({
    this.taskDate = const Value.absent(),
    this.task = const Value.absent(),
  });
  TodoEntriesCompanion.insert({
    required DateTime taskDate,
    required int task,
  })  : taskDate = Value(taskDate),
        task = Value(task);
  static Insertable<TodoEntry> custom({
    Expression<DateTime>? taskDate,
    Expression<int>? task,
  }) {
    return RawValuesInsertable({
      if (taskDate != null) 'task_date': taskDate,
      if (task != null) 'task': task,
    });
  }

  TodoEntriesCompanion copyWith({Value<DateTime>? taskDate, Value<int>? task}) {
    return TodoEntriesCompanion(
      taskDate: taskDate ?? this.taskDate,
      task: task ?? this.task,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskDate.present) {
      map['task_date'] = Variable<DateTime>(taskDate.value);
    }
    if (task.present) {
      map['task'] = Variable<int>(task.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoEntriesCompanion(')
          ..write('taskDate: $taskDate, ')
          ..write('task: $task')
          ..write(')'))
        .toString();
  }
}

class $TodoEntriesTable extends TodoEntries
    with TableInfo<$TodoEntriesTable, TodoEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoEntriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _taskDateMeta = const VerificationMeta('taskDate');
  @override
  late final GeneratedColumn<DateTime?> taskDate = GeneratedColumn<DateTime?>(
      'task_date', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES dates (date)');
  final VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<int?> task = GeneratedColumn<int?>(
      'task', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES tasks (id)');
  @override
  List<GeneratedColumn> get $columns => [taskDate, task];
  @override
  String get aliasedName => _alias ?? 'todo_entries';
  @override
  String get actualTableName => 'todo_entries';
  @override
  VerificationContext validateIntegrity(Insertable<TodoEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_date')) {
      context.handle(_taskDateMeta,
          taskDate.isAcceptableOrUnknown(data['task_date']!, _taskDateMeta));
    } else if (isInserting) {
      context.missing(_taskDateMeta);
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TodoEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TodoEntry.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodoEntriesTable createAlias(String alias) {
    return $TodoEntriesTable(attachedDatabase, alias);
  }
}

abstract class _$TodosDatabase extends GeneratedDatabase {
  _$TodosDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TasksTable tasks = $TasksTable(this);
  late final $DatesTable dates = $DatesTable(this);
  late final $TodoEntriesTable todoEntries = $TodoEntriesTable(this);
  late final TodosDao todosDao = TodosDao(this as TodosDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [tasks, dates, todoEntries];
}
