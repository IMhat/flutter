import 'package:smiley_app/features/home/screens/home.dart';
import 'package:smiley_app/features/home/screens/home_page_body.dart';

import 'package:flutter/material.dart';

import '../../tasks/widgets/taskHome.dart';
import '../widgets/button_go_tasks.dart';
import '../widgets/wallet.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  // @override
  // State<HomePage1> createState() => _HomePage1State();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                      0.2,
                      0.4,
                      0.8
                    ],
                        colors: [
                      (Color(0xff7F00F0)),
                      Color.fromARGB(255, 165, 92, 179),
                      Color.fromARGB(255, 247, 90, 114)
                    ])),
                height: 250,
                margin: const EdgeInsets.only(
                  top: 0,
                ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          width: 300,
                          height: 80,
                          child: const Walletss(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 220),
                  child: const MyButtonNotification()),
              Container(
                margin: const EdgeInsets.only(top: 40, left: 300),
                child: const CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Color.fromARGB(255, 211, 211, 211),
                  backgroundImage: AssetImage('assets/user.png'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 110,
                  margin: const EdgeInsets.only(
                    top: 180,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 250, 249, 249),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(135, 136, 136, 136),
                            blurRadius: 10.0,
                            offset: Offset(0, 5)),
                        BoxShadow(
                          color: Color.fromARGB(255, 233, 232, 232),
                        ),
                      ]),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Hoy",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            SizedBox(height: 10),
                            TasksCounter()
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 60, bottom: 5),
                          height: 120,
                          width: 100,
                          child: const MyButtonGoTasks(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
            const HomePageBody(),
          ],
        ),
      ),
    );
  }
}

class MyButtonNotification extends StatelessWidget {
  const MyButtonNotification({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'Notification',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(
          Icons.notifications_active_rounded,
          size: 40,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        //child: const Text('My Button'),
      ),
    );
  }
}
