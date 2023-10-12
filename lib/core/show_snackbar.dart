import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message){
  final snackBar = SnackBar(
            content:  Text(message),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
}