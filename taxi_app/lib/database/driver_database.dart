import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/driver_model.dart';

class DriverDatabase {
  static final DriverDatabase instance = DriverDatabase._init();
  static Database? _database;

  DriverDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('drivers.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE drivers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        car TEXT,
        distance TEXT,
        eta TEXT
      )
    ''');
  }

  Future<void> insertDriver(Driver driver) async {
    final db = await instance.database;
    await db.insert('drivers', driver.toMap());
  }

  Future<List<Driver>> getAllDrivers() async {
    final db = await instance.database;
    final result = await db.query('drivers');
    return result.map((e) => Driver.fromMap(e)).toList();
  }
}
