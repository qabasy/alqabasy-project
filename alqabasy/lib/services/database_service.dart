import 'package:mysql_client/mysql_client.dart';

//
// import '../models/user.dart';
//
class Settings {
  static const host = 'your-host', port = 3306, userName = 'your-username', password = 'your-password', databaseName = 'your-database';
}
//
// class DatabaseService {
//   Future<MySQLConnection> getConnection() async {
//     final conn = await MySQLConnection.createConnection(
//       host: Settings.host,
//       port: Settings.port,
//       userName: Settings.userName,
//       password: Settings.password,
//       databaseName: Settings.databaseName,
//     );
//     await conn.connect();
//     return conn;
//   }
//
//   Future<void> addUser(User user) async {
//     final conn = await getConnection();
//     await conn.execute(
//       'INSERT INTO users (id, name, email, role) VALUES (:id, :name, :email, :role)',
//       {
//         'id': user.id,
//         'name': user.name,
//         'email': user.email,
//         'role': user.role,
//       },
//     );
//     await conn.close();
//   }
//
//   Future<List<User>> getUsers() async {
//     final conn = await getConnection();
//     final results = await conn.execute('SELECT * FROM users');
//     List<User> users = [];
//     for (final row in results.rows) {
//       users.add(User.fromMap(row.assoc()));
//     }
//     await conn.close();
//     return users;
//   }
//
// // Add more CRUD operations as needed
// }

abstract class BaseDatabaseService<T> {
  Future<MySQLConnection> getConnection() async {
    final conn = await MySQLConnection.createConnection(
      host: Settings.host,
      port: Settings.port,
      userName: Settings.userName,
      password: Settings.password,
      databaseName: Settings.databaseName,
    );
    await conn.connect();
    return conn;
  }

  String get tableName;

  T fromMap(Map<String, dynamic> map);

  Future<void> add(T item, Map<String, dynamic> values) async {
    final conn = await getConnection();
    await conn.execute(
      'INSERT INTO $tableName (${values.keys.join(', ')}) VALUES (${values.keys.map((key) => ':$key').join(', ')})',
      values,
    );
    await conn.close();
  }

  Future<List<T>> getAll() async {
    final conn = await getConnection();
    final results = await conn.execute('SELECT * FROM $tableName');
    List<T> items = [];
    for (final row in results.rows) {
      items.add(fromMap(row.assoc()));
    }
    await conn.close();
    return items;
  }

  Future<void> update(int id, Map<String, dynamic> values) async {
    final conn = await getConnection();
    await conn.execute(
      'UPDATE $tableName SET ${values.keys.map((key) => '$key = :$key').join(', ')} WHERE id = :id',
      {...values, 'id': id},
    );
    await conn.close();
  }

  Future<void> delete(int id) async {
    final conn = await getConnection();
    await conn.execute('DELETE FROM $tableName WHERE id = :id', {'id': id});
    await conn.close();
  }
}
