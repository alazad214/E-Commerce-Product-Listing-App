import 'package:ecommerce_product_listing_app/features/home/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProdactsDb {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY,
            title TEXT,
            price REAL,
            discountPercentage REAL,
            rating REAL,
            thumbnail TEXT
          )
        ''');
      },
    );
  }

  static Future<void> insertProducts(List<Products> products) async {
    final db = await database;
    final batch = db.batch();

    for (var product in products) {
      batch.insert('products', {
        'id': product.id,
        'title': product.title,
        'price': product.price,
        'discountPercentage': product.discountPercentage,
        'rating': product.rating,
        'thumbnail': product.thumbnail,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }

  static Future<List<Products>> getProducts() async {
    final db = await database;
    final data = await db.query('products');

    return data
        .map(
          (e) => Products(
            id: e['id'] as int,
            title: e['title'] as String,
            price: e['price'] as double,
            discountPercentage: e['discountPercentage'] as double,
            rating: e['rating'] as double,
            thumbnail: e['thumbnail'] as String,
          ),
        )
        .toList();
  }
}
