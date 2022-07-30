import 'package:drift/drift.dart';

class Dates extends Table {
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column>? get primaryKey => {date};
}
