import 'package:smiley_app/features/home/screens/home.dart';
import 'package:smiley_app/features/home/screens/home_page_body.dart';

import 'package:flutter/material.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  // @override
  // State<HomePage1> createState() => _HomePage1State();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: const Expanded(child: HomePage()),
          ),
          const Expanded(child: SingleChildScrollView(child: HomePageBody())),

          // Expanded(child: SingleChildScrollView(child: AcercaDe())),
        ],
      ),
    );
  }
}
