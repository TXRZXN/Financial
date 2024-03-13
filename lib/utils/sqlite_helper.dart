import 'package:flutter/widgets.dart';
import 'package:play/model/modelsql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQlHelper {
  final String nameDatabase = "Portfolio.db";
  final String tableDatabase = "PortTable"; //table มีกี่อันก็ได้
  int version = 1;
  //detail Column Table
  final String idColumn = "id";
  final String idShop = "idShop";
  final String nameShop = "nameShop";

  SQlHelper() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    //CheckDatabase
    await openDatabase(
      join(await getDatabasesPath(), nameDatabase),
      version: version,
      onCreate: (db, version) => db.execute(
          'CREATE TABLE $tableDatabase ($idColumn INTEGER PRIMARY KEY, $idShop TEXT,$nameShop Text)'),
    );
  }

  Future<Database> connectDatabase() async {
    return openDatabase(join(await getDatabasesPath(), nameDatabase));
  }

  Future<void> insertToSQlite(SqlModel model) async {
    ///When use
    ///await SQlHelper().insertToSQlite(model).then((value){});
    Database database = await connectDatabase();
    try {
      database.insert(
        tableDatabase,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      debugPrint("insert Data Error ==> ${e.toString()}");
    }
  }

  Future<List<SqlModel>> readSQlite() async {
    List<SqlModel> listModel = [];
    Database database = await connectDatabase();
    List<Map<String, dynamic>> maps = await database.query(tableDatabase);
    for (var map in maps) {
      SqlModel sqlModel = SqlModel.fromJson(map);
      listModel.add(sqlModel);
    }
    return listModel;
  }

  Future<void> deleteRowSqliteByID(int id) async {
    Database database = await connectDatabase();
    await database.delete(tableDatabase, where: '$idColumn=$id').then(
          (value) => {
            debugPrint("Delete $id Success"),
          },
        );
  }

  Future<void> deleteAllSqlite() async {
    Database database = await connectDatabase();
    await database.delete(tableDatabase).then(
          (value) => {
            debugPrint("Delete All Success"),
          },
        );
  }
}
