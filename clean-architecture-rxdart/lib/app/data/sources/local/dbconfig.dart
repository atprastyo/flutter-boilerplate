import 'package:sqflite/sqflite.dart';

import 'tables/todo.table.dart';

class DbConfig {
  late Database _db;

  Future<Database> getInstance() async {
    _db = await openDatabase('my_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(TodoTable.create());
    });

    return _db;
  }

  void close() async {
    await _db.close();
  }
}
