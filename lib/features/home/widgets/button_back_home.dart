import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/bottom_bar.dart';

class MyButtonBackHome extends StatelessWidget {
  const MyButtonBackHome({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(context, BottomBar.routeName);
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 100,
        height: 50,
        child: Row(
          children: [
            Icon(Icons.home),
          ],
        ),
      ),
    );
  }
}
