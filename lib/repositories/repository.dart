import 'package:flutter_hackernewsapp/repositories/database_connection.dart';
import 'package:flutter_hackernewsapp/services/network.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  Future<int> insertData(String table, Map<String, dynamic> data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> readData(String table) async {
    var connection = await database;
    return await connection.query(table);
  }

  Future<List<Map<String, dynamic>>> readDataById(
      String table, int newsId) async {
    var connection = await database;
    return await connection.query(table, where: 'id=?', whereArgs: [newsId]);
  }

  Future<dynamic> getIds() async {
    return await NetworkHelper().getIds();
  }

  Future<dynamic> getData(int id) async {
    return await NetworkHelper().getData(id);
  }
}
