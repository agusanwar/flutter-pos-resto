import 'package:dartz/dartz.dart';
import 'package:posresto/data/models/home_product_quantity.dart';
import 'package:posresto/data/models/order_model.dart';
import 'package:posresto/data/models/response/product_response_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductLocalDatasource {
  ProductLocalDatasource._init();

  static final ProductLocalDatasource instance = ProductLocalDatasource._init();

  // create table product
  final String tableProduct = 'products';
  // create table product
  final String tableOrder = 'orders';
  // create table product
  final String tableOrderItem = 'order_items';

  // database sqflite
  static Database? _database;
  // create database
  Future<void> _createDb(Database db, int version) async {
    // table product
    await db.execute(''' 
      CREATE TABLE $tableProduct (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId INTEGER,
        name TEXT,
        categoryId INTEGER,
        categoryName TEXT,
        desc TEXT,
        image TEXT,
        price TEXT,
        stock INTEGER,
        status INTEGER,
        isFavorite INTEGER,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');

    // table order
    await db.execute('''
      CREATE TABLE $tableOrder (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        payment_amount INTEGER,
        sub_total INTEGER,
        tax INTEGER,
        discount INTEGER,
        service_charge INTEGER,
        total INTEGER,
        payment_method TEXT,
        total_item INTEGER,
        id_kasir INTEGER,
        nama_kasir TEXT,
        no_meja INTEGER,
        transaction_time INTEGER,
        is_sync INTEGER DEFAULT 0,
      )
    ''');

    // table order item
    await db.execute('''
      CREATE TABLE $tableOrderItem (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_order INTEGER,
        id_product INTEGER,
        quantity INTEGER,
        price INTEGER,
      )
    ''');
  }

  // init db
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  // TBALE PRODUCT
  //create database product
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(
      'dbresto.db',
    );
    return _database!;
  }

  //insert data product
  Future<void> insertProduct(Product product) async {
    final db = await instance.database;
    await db.insert(
      tableProduct,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //insert list of product one
  Future<void> insertProducts(List<Product> products) async {
    final db = await instance.database;
    for (var product in products) {
      await db.insert(
        tableProduct,
        product.toLocalMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      // print('inserted success ${product.name}');
    }
  }

  //get all products
  Future<List<Product>> getProducts() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableProduct);
    return List.generate(maps.length, (i) {
      return Product.fromLocalMap(maps[i]);
    });
  }

  //delete all products
  Future<void> deleteAllProducts() async {
    final db = await instance.database;
    await db.delete(tableProduct);
  }

  // TABLE ORDER
  // save to databsae order
  Future<void> saveOrder(OrderModel order) async {
    final db = await instance.database;
    int id = await db.insert(
      tableOrder,
      order.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // insert into table order item
    for (var item in order.orderItems) {
      await db.insert(
        tableOrderItem,
        item.toLocalMap(id),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  //get data order
  Future<List<OrderModel>> getOrdersIsNotSync() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query(tableOrder, where: 'is_sync = ?', whereArgs: [0]);
    return List.generate(maps.length, (i) {
      return OrderModel.fromMap(maps[i]);
    });
  }

  //get order item by order id
  Future<List<ProductQuantity>> getOrdersById(int orderId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db
        .query(tableOrderItem, where: 'id_order = ?', whereArgs: [orderId]);
    return List.generate(maps.length, (i) {
      return ProductQuantity.froLocalmMap(maps[i]);
    });
  }

  //update order id is sync
  Future<void> updateOrderIsSync(int orderId) async {
    final db = await instance.database;
    await db.update(tableOrder, {'is_sync': 1},
        where: 'id = ?', whereArgs: [orderId]);
  }
}
