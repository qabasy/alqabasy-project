import 'package:flutter/material.dart';

class DialogManager {
  static Future<void> showInfoDialog(BuildContext context, String title, String content) async {
    return _showDialog(context, title, content, Icons.info, Colors.blue);
  }

  static Future<void> showSuccessDialog(BuildContext context, String title, String content) async {
    return _showDialog(context, title, content, Icons.check_circle, Colors.green);
  }

  static Future<void> showWarningDialog(BuildContext context, String title, String content) async {
    return _showDialog(context, title, content, Icons.warning, Colors.orange);
  }

  static Future<void> showErrorDialog(BuildContext context, String title, String content) async {
    return _showDialog(context, title, content, Icons.error, Colors.red);
  }

  static Future<void> _showDialog(BuildContext context, String title, String content, IconData icon, Color iconColor) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
