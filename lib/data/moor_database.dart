import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Tasks extends Table {
// autoincrements make it primary automatic
IntColumn get id => integer().autoIncrement()();
TextColumn get name => text().withLength(min: 1,max: 50)();
DateTimeColumn get dueDate => dateTime().nullable()();
BoolColumn get completed => boolean().withDefault(Constant(false))(); 

}
@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));
@override
int get schemaVersion => 1;

Future<List<Task>> getAllTasks() => select(tasks).get();
Stream<List<Task>> watchAllTasks() => select(tasks).watch();
Future insertTask(Task task) => into(tasks).insert(task);
Future updateTask(Task task) => update(tasks).replace(task);
Future deleteTask(Task task) => delete(tasks).delete(task);
}