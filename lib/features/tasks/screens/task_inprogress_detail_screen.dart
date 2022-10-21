import 'package:smiley_app/common/widgets/bottom_bar.dart';
import 'package:smiley_app/common/widgets/custom_button.dart';
import 'package:smiley_app/common/widgets/stars.dart';
import 'package:smiley_app/constants/global_variables.dart';

import 'package:smiley_app/features/search/screens/search_screen.dart';
import 'package:smiley_app/models/check_task_progress.dart';
import 'package:smiley_app/models/task_inprogress.dart';

import 'package:smiley_app/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../account/services/account_services.dart';
import '../widgets/check_tasks.dart';

class TaskInprogressDetailsScreen extends StatefulWidget {
  static const String routeName = '/taskInprogress-details';

  final TaskInprogress task;

  const TaskInprogressDetailsScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<TaskInprogressDetailsScreen> createState() =>
      _TaskInprogressDetailsScreenState();
}

class _TaskInprogressDetailsScreenState
    extends State<TaskInprogressDetailsScreen> {
  final AccountServices productDetailsServices = AccountServices();

  void acept() {
    productDetailsServices.accept(
      context: context,
      assignmentUser: widget.task.assignmentUser,
      category: widget.task.category,
      createdBy: widget.task.createdBy,
      description: widget.task.description,
      points: widget.task.points,
      priority: widget.task.priority,
      id: widget.task.id,
      title: widget.task.title,
      status: "done",

      // Navigator.pushNamed(
      //   context,
      //   'ChallengeAcepted',
      // );
    );
    Navigator.pushNamed(context, BottomBar.routeName);
  }

  // double avgRating = 0;
  // double myRating = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   double totalRating = 0;
  //   for (int i = 0; i < widget.product.rating!.length; i++) {
  //     totalRating += widget.product.rating![i].rating;
  //     if (widget.product.rating![i].userId ==
  //         Provider.of<UserProvider>(context, listen: false).user.id) {
  //       myRating = widget.product.rating![i].rating;
  //     }
  //   }

  //   if (totalRating != 0) {
  //     avgRating = totalRating / widget.product.rating!.length;
  //   }
  // }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  // void addToCart() {
  //   productDetailsServices.addToCart(
  //     context: context,
  //     product: widget.product,
  //   );
  // }
  final buttonStyleDowload = ElevatedButton.styleFrom(
      elevation: 0,
      primary: const Color.fromARGB(255, 205, 203, 203),
      onPrimary: const Color.fromARGB(255, 0, 34, 255));
  final textStyleTitle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 203, 203),
      appBar: AppBar(
        title: const Text("Progreso de la tarea"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Flex(direction: Axis.vertical, children: [
                Text(
                  widget.task.title,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.justify,
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(right: 20),
                width: 400,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Para", style: textStyleTitle),
                    Container(
                      width: 250,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(
                        children: [
                          LayoutBuilder(
                              builder: (context, constraints) => Container(
                                    width: constraints.maxWidth * 10,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 199, 197, 198),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  )),
                          Positioned.fill(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                ),
                                Flex(direction: Axis.horizontal, children: [
                                  Text(
                                    widget.task.assignmentUser,
                                    style: const TextStyle(fontSize: 10),
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 200),
              padding: const EdgeInsets.all(10.0),
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 158, 105),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 251, 251)),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                widget.task.status,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(right: 200),
                child: Text(
                  "Descripción",
                  style: textStyleTitle,
                )),
            const Divider(
              indent: 5,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15.0),

              // decoration: BoxDecoration(
              //     border:
              //         Border.all(color: const Color.fromARGB(255, 0, 21, 255)),
              //     borderRadius: BorderRadius.circular(10)),
              child: Flex(direction: Axis.vertical, children: [
                Text(
                  widget.task.description,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
                  textAlign: TextAlign.justify,
                ),
              ]),
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.only(left: 0),
                width: 500,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.file_copy),
                    //Image(image: AssetImage("assets/tareaasignada.jpg")),
                    const Text("34 MB"),
                    ElevatedButton(
                      style: buttonStyleDowload,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '',
                        );
                      },
                      child: const Text("Download"),
                    ),
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(left: 0),
                width: 500,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Aa",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    Icon(Icons.emoji_emotions_outlined),
                    Icon(Icons.attach_file),
                    Icon(Icons.today_outlined),
                    Text(
                      "vence 10/10/22",
                      style: TextStyle(color: Colors.red),
                    ),
                    Icon(Icons.person_add)
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Text(
                    ' ${widget.task.points}',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 27, 112, 248),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    " Puntos",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 112, 248)),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 2,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 10),
            CheckTask(),
            Container(
              padding: const EdgeInsets.all(1.0),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: AlignmentDirectional.topEnd,
                    colors: [
                      Color.fromARGB(255, 242, 133, 157),
                      Color.fromARGB(255, 167, 79, 211),
                    ]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: OutlinedButton.icon(
                icon: const Icon(Icons.check, color: Colors.black),
                label:
                    const Text("Done", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  acept();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(30),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[850]!.withOpacity(0.29),
            offset: const Offset(-10, 15),
            blurRadius: 10,
          )
        ]);
