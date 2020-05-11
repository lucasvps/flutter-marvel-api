import 'dart:io';

import 'package:marvel_api/app/models/character_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  String favoritesTable = 'favorites';
  String colId = 'id';
  String colName = 'name';
  String colDescription = 'description';
  String colThumbnail = 'thumbnailExt';

  static DatabaseHelper _databaseHelper; // Singleton.

  static Database
      _database; //Instancia privada, apenas uma instancia pro código todo.

  // construtor nomeado para instancia.
  DatabaseHelper._createInstance();

  //Cosntrutor verifica se a instancia ja existe ou nao. Se nao existe, cria ela.
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  // Recupera o banco
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  // Inicializa o banco
  Future<Database> initializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'marvel-api.db';
    //print(path);

    var favoritesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return favoritesDatabase;
  }

  // Cria o banco em si
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $favoritesTable($colId INTEGER PRIMARY KEY , $colName TEXT, $colDescription TEXT, $colThumbnail TEXT)'); //, $colThumbnail TEXT
  }

  // Adicionar objeto no banco
  Future<int> addFavorite(Character char) async {
    Database db = await this.database;

    try {
      var result = await db.insert(favoritesTable, char.toMap());
      return result;
    } catch(e){
      return 0;
    }
    
  }


  Future removeFavorite(Character char) async {
    Database db = await this.database;

    print(char.id);
    print('DELETE FROM $favoritesTable WHERE $colId = ${char.id}');

    var result = await db.rawDelete('DELETE FROM $favoritesTable WHERE $colId = ${char.id}');
    return result;
  }

  // Fetch all favorites
  Future<List<Character>> getFavorites() async {
    Database db = await this.database;

    var result = await db.query(favoritesTable);

    // Retonar uma lista, e nao um map.
    List<Character> favs = result.isNotEmpty
        ? result.map((f) => Character.fromMap(f)).toList()
        : [];

    return favs;
  }

  Future close() async {
    Database db = await this.database;
    db.close();
  }
}
