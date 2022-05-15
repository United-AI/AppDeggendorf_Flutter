import 'dart:async';

import 'package:deggendorf_app/lib/db_model/user.dart';
import 'package:deggendorf_app/lib/db_model/event.dart';
import 'package:deggendorf_app/lib/db_model/eventPerUser.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase
{
  static final AppDatabase instance = AppDatabase.init();
  static Database? _database;

  AppDatabase.init();

  Future<Database> get database async
  {
    if(_database != null)
    {
      return _database!;
    }
    else
    {
      _database = await initDB('app.db');
    }

    return _database!;
  }

  Future<Database> initDB(String filePath) async
  {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  Future createDB(Database db, int version) async
  {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final blobType = 'BLOB NOT NULL';

    await db.execute('''
    CREATE TABLE $tableUsers (
    ${UserFields.id} $idType,
    ${UserFields.location} $textType,
    ${UserFields.username} $textType,
    ${UserFields.password} $textType,
    ${UserFields.passwordSalt} $textType,
    ${UserFields.passwordHashAlgorithm} $textType,
    ${UserFields.firstName} $textType,
    ${UserFields.lastName} $textType,
    ${UserFields.email} $textType,
    ${UserFields.phoneNumber} $textType,
    FOREIGN KEY (id) REFERENCES EventsPerUser (userID),
    ''');

    await db.execute('''
    CREATE TABLE $tableEvents (
    ${EventFields.id} $idType,
    ${EventFields.name} $textType,
    ${EventFields.dateStart} $textType,
    ${EventFields.dateFinish} $textType,
    ${EventFields.location} $textType,
    ${EventFields.QRCode} $textType,
    FOREIGN KEY (id) REFERENCES EventsPerUser (eventID),
    ''');

    await db.execute('''
    CREATE TABLE $tableEventsPerUser (
    ${EventsPerUserFields.userID} $idType,
    ${EventsPerUserFields.eventID} $idType,
    ''');
  }

  // CRUD for data table USER
  Future<User> createUser(User user) async
  {
    final db = await instance.database;

    final id = await db.insert(tableUsers, user.toJson());

    return user.copy(id: id);
  }

  Future<User> readUser(int id) async
  {
    final db = await instance.database;
    
    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty)
    {
        return User.fromJson(maps.first);
    }
    else
    {
      throw Exception('ID $id not found');
    }
  }

  Future<List<User>> readAllUsers() async
  {
    final db = await instance.database;

    final orderBy = '${UserFields.id} ASC';

    final result = await db.query(tableUsers, orderBy: orderBy);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> updateUser(User user) async
  {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async
  {
    final db = await instance.database;

    return await db.delete(
      tableUsers,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  // CRUD for data table EVENT
  Future<Event> createEvent(Event event) async
  {
    final db = await instance.database;

    final id = await db.insert(tableEvents, event.toJson());

    return event.copy(id: id);
  }

  Future<Event> readEvent(int id) async
  {
    final db = await instance.database;

    final maps = await db.query(
      tableEvents,
      columns: EventFields.values,
      where: '${EventFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty)
    {
      return Event.fromJson(maps.first);
    }
    else
    {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Event>> readAllEvents() async
  {
    final db = await instance.database;

    final orderBy = '${EventFields.id} ASC';

    final result = await db.query(tableEvents, orderBy: orderBy);

    return result.map((json) => Event.fromJson(json)).toList();
  }

  Future<int> updateEvent(Event event) async
  {
    final db = await instance.database;

    return db.update(
      tableEvents,
      event.toJson(),
      where: '${EventFields.id} = ?',
      whereArgs: [event.id],
    );
  }

  Future<int> deleteEvent(int id) async
  {
    final db = await instance.database;

    return await db.delete(
      tableEvents,
      where: '${EventFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async
  {
    final db = await instance.database;

    db.close();
  }
}