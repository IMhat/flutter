import 'package:flutter/material.dart';
import 'package:animated_background/particles.dart';

class ChallengeAcepted extends StatelessWidget {
  const ChallengeAcepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
          margin: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            children: [
              Container(child: Image.asset("assets/desafioaceptado.jpeg")),
              const SizedBox(height: 20),
              const Text(
                "Tarea Aceptada",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 100),
              Container(
                child: const MyButtonObjetives(),
              )
            ],
          )),
    );
  }
}

class MyButtonObjetives extends StatelessWidget {
  const MyButtonObjetives({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'ProgresTaskView',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          gradient:
              const LinearGradient(begin: AlignmentDirectional.topEnd, colors: [
            Color.fromARGB(255, 242, 133, 157),
            Color.fromARGB(255, 167, 79, 211),
          ]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'MIS OBJETIVOS',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
