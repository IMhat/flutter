import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtonGoTasks extends StatelessWidget {
  const MyButtonGoTasks({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'ManageTasks',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/home.jpeg"),
      ),
    );
  }
}
