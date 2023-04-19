import 'package:flutter/material.dart';

Future<dynamic> showConfirmationDialog(BuildContext context) {
  String title = 'Atenção';
  String content = 'Confirmar ação de excluir?';
  String affirmativeOption = 'Confirmar';
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(affirmativeOption,
                  style: const TextStyle(color: Colors.green)),
            ),
          ],
        );
      }
  );
}
