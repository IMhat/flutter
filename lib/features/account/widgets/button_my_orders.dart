import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtonOrders extends StatelessWidget {
  const MyButtonOrders({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'Account',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 150,
        height: 60,
        // decoration: BoxDecoration(
        //   gradient:
        //       const LinearGradient(begin: AlignmentDirectional.topEnd, colors: [
        //     Color.fromARGB(255, 242, 133, 157),
        //     Color.fromARGB(255, 167, 79, 211),
        //   ]),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: const Text(
          'Your orders',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
