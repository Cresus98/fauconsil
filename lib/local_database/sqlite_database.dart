
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/appuser.dart';

class DbFauconManager {
  Database ? _database;

  Future openDb()async
  {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), "faucon.db"),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY autoincrement,nom TEXT,prenom TEXT,sexe TEXT,nationalite TEXT,connecte INTEGER,password TEXT,email TEXT,profession TEXT)');
      },);
  }

  Future<int> insertCouture( AppUser user) async
  {
    await openDb();
    int _id = await _database!.insert('users', user.toMap());
    return _id;
  }
  void delete()
  async{
    String path = join( await getDatabasesPath(), 'users.db');
    await deleteDatabase(path);
  }
  Future<void> delete_all_table()async
  {
    await openDb();

    _database!.execute("delete from "'users');
  }
  Future<List<AppUser>> getCoutureList() async
  {
    await openDb();
    final List<Map<String,dynamic>> maps=await _database!.query('users');
    return List.generate(maps.length, (index) {
      return AppUser(

          id: maps[index]['id'],
          nom: maps[index]['nom'], prenom:maps[index]['prenom'],
          sexe: maps[index]['sexe'],nationalite: maps[index]['nationalite'],
          password: maps[index]['password'],email: maps[index]['email'],
          profession: maps[index]['profession'],
          connecte: maps[index]['connecte']);
    });
  }

  Future<AppUser?> getCouturier() async
  {
    await openDb();
    List<AppUser> users=[];
    final List<Map<String,dynamic>> maps=await _database!.query('couturiers');
    users= List.generate(maps.length, (index) {
      return AppUser.fromMap(maps[index]);
      /*
      return AppUser(
          id: maps[index]['uid'], infos: maps[index]['info'], description:maps[index]['description'],photo: maps[index]['photo'],mjr: maps[index]['mjr'],connecte: maps[index]['connecte']==1?true:false);
      */
    });
    return maps.isEmpty?null:users[0];
  }

  Future<int> updateCouture(AppUser user)
  async
  {
    await openDb();

    return await _database!.update(
        'couturiers',
        user.toMap(),
        where: 'uid = ?',
        whereArgs: [user.id]
    );
  }
  Future<void> deleteCouture( AppUser appUser)
  async {
    await openDb();
    await _database!.delete(
        'couturiers',
        where: 'id = ?',
        whereArgs: [appUser.id]
    );
  }
}