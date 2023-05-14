import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper{
  static Database? _db;


  static const String dbName = 'scn.db';
  static const String authorizationTable = "Auth";
  static const int version = 1;


  static const String key = 'key';
  static const String secret = 'secret';


  Future<Database?> get db async{
    if(_db == null){
      _db = await initDb();
    }
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
    }

    _onCreate(Database db, int version) async{
      await db.execute(
        "CREATE TABLE $authorizationTable ($key TEXT, $secret TEXT, PRIMARY KEY ($secret)) ");
    }

}
