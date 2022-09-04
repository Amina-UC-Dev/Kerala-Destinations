import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBaseProvider extends ChangeNotifier{

  Database? db;

  Future initDatabase() async {
    db = await openDatabase(
      'destination_app.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE States(id INTEGER PRIMARY KEY ,stateId TEXT,countryId TEXT,'
                'stateName TEXT,status TEXT)');
        await db.execute(
            'CREATE TABLE Countries(id INTEGER PRIMARY KEY ,countryId TEXT,'
                'countryName TEXT,countryCode TEXT)');
        await db.execute(
            'CREATE TABLE DestinationTypes(id INTEGER PRIMARY KEY, destinationTypeId TEXT, destinationType TEXT, parentDestinationTypeId TEXT, isRouteType TEXT, status TEXT)');
        await db.execute(
            'CREATE TABLE Destinations(destinationId TEXT,localId TEXT,destinationPhoto TEXT,destinationImageURL1 TEXT,destinationImageURL2 TEXT,destinationImageURL3 TEXT,destinationImageURL4 TEXT,'
                'customerId TEXt,deviceRegistrationId TEXT, destinationTypeNames TEXT, destinationName TEXT, localName TEXT,'
                'cityName TEXT, provinceName TEXT, countryName TEXT, postalCode TEXT, destinationPhotoCourtesy TEXT, destinationDescription TEXT, bestSeason TEXT,'
                'destinationAttractions TEXT, latitude TEXT, longitude TEXT,createdDate TEXT)');
      },
    );
    print("DB PATH : ${db!.path}");
  }

  Future insertDataToDataBase(String query, List data) async {
    await db!.rawInsert(query, data);
  }

  Future updateDataToDataBase(String query, List data) async {
    await db!.rawUpdate(query, data);
  }

  Future deleteDataFromDataBase(String query) async {
    return await db!.rawDelete(query);
  }

  Future deleteDataFromDataBaseWith(String query,List data) async {
    return await db!.rawDelete(query,data);
  }

  Future clearTable() async {
    db!.execute("delete from Destinations");
    db!.execute("delete from Countries");
    db!.execute("delete from States");
    db!.execute("delete from DestinationTypes");
  }

  Future deleteDataFromDataBaseWithParam(String query,List data) async {
    return await db!.rawDelete(query,data);
  }

  Future<List<Map<String, Object?>>> getDataFromTable(
      String query, List data) async {
    return await db!.rawQuery(query, data);
  }

  Future<List<Map<String, Object?>>> getDataFromTableWithoutCondition(
      String query,
      ) async {
    print("PPPP ${db!.path}");
    return await db!.rawQuery(query);
  }

  Future bulkInsert(List<Map<String,dynamic>> rowList,String table) async{
    await db!.transaction((txn)async {
      var batch = txn.batch();
      for (var rowData in rowList) {
        try {
          batch.insert(table, rowData,conflictAlgorithm: ConflictAlgorithm.replace);
        }
        catch(exception){
          print(exception);
        }
      }
      var list = await batch.commit(continueOnError: false);
    });
    return [];
  }

}