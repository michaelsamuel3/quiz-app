// ignore_for_file: unused_element, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:quizapp/models/details.dart';
import 'package:sqflite/sqflite.dart';

late Database _db;

Future<void> initializeDatabase() async {
  _db = await openDatabase('details.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE details(name TEXT,age ,email TEXT PRIMARY KEY,password TEXT)');
  });
}


Future<dynamic> getAllDetails() async {
    final List<Map<String, dynamic>> _values =
        await _db.rawQuery('SELECT * FROM details');
    print(_values);
    return _values;
  }

  Future<void> addDetails(Details value) async {
    int id = await _db.insert('details', value.toMap());
    print(id);
    final List<Map<String, dynamic>> _values =
        await _db.rawQuery('SELECT * FROM details');
    print(_values);
  }

