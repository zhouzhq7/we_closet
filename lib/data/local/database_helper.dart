import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../core/models/clothing_item.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('wardrobe.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE clothing_items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      category TEXT,
      color TEXT,
      imagePath TEXT
    )
    ''');
  }

  Future<int> addClothingItem(ClothingItem item) async {
    final db = await instance.database;
    return await db.insert('clothing_items', item.toMap());
  }

  Future<List<ClothingItem>> getClothingItems() async {
    final db = await instance.database;
    final maps = await db.query('clothing_items');
    return maps.map((e) => ClothingItem.fromMap(e)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
