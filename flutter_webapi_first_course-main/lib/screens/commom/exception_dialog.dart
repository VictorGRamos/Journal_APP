import 'package:flutter/material.dart';

showExceptionDialog(
  BuildContext context, {
  required String content,
  String title = "Um problema aconteceu",
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(children:[
            const Icon(
              Icons.warning_amber_rounded,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            )
          ]),
          content: Text(content),
          actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Ok"))],
        );
      });
}
