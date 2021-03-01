import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  dynamic setDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'db_hackernewsapp');
    final Database database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }
}

Future<void> _onCreatingDatabase(Database database, int version) async {
  await database.execute(
      "CREATE TABLE news(id INTEGER PRIMARY KEY,title TEXT,date INTEGER,url TEXT)");
}
