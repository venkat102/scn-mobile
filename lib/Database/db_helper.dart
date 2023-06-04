import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper{
  static const dbName = "scn.db";
  static const dbVersion = 1;
  static const tableName = "global_defaults";
  static const colKey = "key";
  static const colValue = "value";
  static const tableDict = {
    "global_defaults":[
      "key TEXT PRIMARY KEY",
      "value TEXT NOT NULL"
    ],
    "customer":[
      "customer TEXT PRIMARY KEY",
      "phone_no TEXT",
      "aadhar_no TEXT",
      "settop_box_no TEXT",
      "disabled INTEGER DEFAULT 0",
      "last_modified TEXT",
    ],
    "payment":[
      "id TEXT PRIMARY KEY",
      "customer TEXT"
      "paid_amount REAL NOT NULL",
      "posting_date TEXT",
      "paid_for TEXT"
    ]
  };


  static final DbHelper instance = DbHelper();
  static Database? scnMobile;

  Future<Database?> get db async{
    scnMobile ??= await _initDb();
    return scnMobile;
  }

  _initDb()async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    return await openDatabase(path,version: dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version)async{
    tableDict.forEach((key, value) => _createTable(db, version, tableName, value.join(', ')));
  }

  _createTable(Database db, int version, String tableName, String col)async{
    await db.execute("""
      Create TABLE IF NOT EXISTS $tableName{
        $col
      }
    """);
  }

  Future <int> insert(Map<String,dynamic> row) async{
    Database? db = await instance.db;
    return await db!.insert(tableName, row);
  }

  Future <List<Map<String, dynamic>>> getAll() async{
    Database? db = await instance.db;
    return await db!.query(tableName);
  }

  Future <int> update(Map<String, dynamic> row) async{
    Database? db = await instance.db;
    String key = row[colKey];
    return await db!.update(tableName, row, where: '$colKey = ?', whereArgs: [key]);
  }

  Future <int> delete(int key) async {
    Database? db = await instance.db;
    return await db!.delete(tableName, where: '$colKey = ?', whereArgs: [key]);

  }

  Future close() async{
    Database? db = await instance.db;
    db!.close();
  }
}
