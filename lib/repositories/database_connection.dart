import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'db_hackernewsapp');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }
}

_onCreatingDatabase(Database database, int version) async {
  await database.execute(
      "CREATE TABLE news(id INTEGER PRIMARY KEY,title TEXT,date TEXT,url TEXT)");
}
