import 'dart:async';

import 'package:mysql_utils/mysql_utils.dart';

class DatabaseService {
  final MysqlUtils db;

  DatabaseService()
      : db = MysqlUtils(
          settings: {
            'host': '127.0.0.1',
            'port': 3306,
            'user': 'root',
            'password': 'root',
            'db': 'alqabasy',
            'maxConnections': 10,
            'secure': true,
            'prefix': 'su_',
            'pool': false,
            'collation': 'utf8mb4_general_ci',
          },
          errorLog: (error) {
            print(error);
          },
          sqlLog: (sql) {
            print(sql);
          },
          connectInit: (db1) async {
            print('whenComplete');
          },
        );

  Future<void> close() async {
    await db.close();
  }

  Future<ResultFormat> query(String sql) async {
    return await db.query(sql);
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    await db.insert(table: table, insertData: data);
  }

  Future<void> update(String table, Map<String, dynamic> data, String where) async {
    await db.update(table: table, updateData: data, where: where);
  }

  Future<void> delete(String table, String where) async {
    await db.delete(table: table, where: where);
  }

  Future<List<Map<String, dynamic>>> getUserByUsername(String username) async {
    final result = await db.query('SELECT * FROM users WHERE username = ?');

    // print(result);
    return [result.toMap()];
  }

  Future<bool> userExists(String username, String password) async {
    final result = await db.query(
      'SELECT * FROM users WHERE name = "$username" AND password = "$password";',
      // debug: true,
    );
    return result.rows.length == 1;
  }
}

class User {
  late final String? username;
  late final String? password;
  User({required this.username, required this.password});
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final DatabaseService _databaseService = DatabaseService();
//
//   @override
//   void dispose() {
//     _databaseService.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Database Service Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _performDatabaseOperations,
//           child: Text('Perform DB Operations'),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _performDatabaseOperations() async {
//     // Example query
//     List<Map<String, dynamic>> results = (await _databaseService
//         .query('SELECT * FROM your_table')) as List<Map<String, dynamic>>;
//     print(results);
//
//     // Example insert
//     await _databaseService
//         .insert('your_table', {'column1': 'value1', 'column2': 'value2'});
//   }
// }
//
