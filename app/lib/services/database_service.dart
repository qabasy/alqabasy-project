import 'package:app/services/hash_service.dart';
import 'package:mysql_client/mysql_client.dart';

import '../models/order.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  MySQLConnection? _connection;

  final HashService _hashService = HashService();

  String hashPassword(final String password) {
    return _hashService.generateMd5(password);
  }

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<MySQLConnection> get connection async {
    if (_connection != null) return _connection!;
    _connection = await _initConnection();
    return _connection!;
  }

  Future<MySQLConnection> _initConnection() async {
    final conn = await MySQLConnection.createConnection(
      host: 'localhost', // Replace with your MySQL host
      port: 3306, // Replace with your MySQL port
      userName: 'root', // Replace with your MySQL username
      password: 'root', // Replace with your MySQL password
      databaseName: 'alqabasy_database', // Replace with your MySQL database name
    );
    await conn.connect();
    return conn;
  }

  Future<void> insertOrder(Order order) async {
    final conn = await connection;
    await conn.execute(
      'INSERT INTO Orders (id, clientId, amount, product, price, location, discount, driverId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [order.id, order.clientId, order.amount, order.product, order.price, order.location, order.discount, order.driverId] as Map<String, dynamic>?,
    );
  }

  Future<List<Order>> getOrders() async {
    final conn = await connection;
    final results = await conn.execute('SELECT * FROM Orders');
    return results.rows.map((row) {
      return Order(
        id: int.tryParse(row.colAt(0) ?? "0") ?? 0,
        clientId: int.tryParse(row.colAt(1) ?? "0") ?? 0,
        amount: double.tryParse(row.colAt(2) ?? "0") ?? 0,
        product: row.colAt(3) ?? "",
        price: double.tryParse(row.colAt(4) ?? "0") ?? 0,
        location: row.colAt(5) ?? "",
        discount: double.tryParse(row.colAt(6) ?? "0") ?? 0,
        driverId: int.tryParse(row.colAt(7) ?? "0") ?? 0,
      );
    }).toList();
  }

// Add more CRUD operations as needed
}
