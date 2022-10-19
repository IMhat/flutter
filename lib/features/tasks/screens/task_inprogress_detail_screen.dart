import 'package:smiley_app/common/widgets/bottom_bar.dart';
import 'package:smiley_app/common/widgets/custom_button.dart';
import 'package:smiley_app/common/widgets/stars.dart';
import 'package:smiley_app/constants/global_variables.dart';

import 'package:smiley_app/features/search/screens/search_screen.dart';
import 'package:smiley_app/models/task_inprogress.dart';

import 'package:smiley_app/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../account/services/account_services.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 114, 110),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 50, right: 250),
                child: Wrap(
                  children: const [
                    Text("Back to home"),
                    //MyButtonBackHome(),
                  ],
                )),
            Container(
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(top: 60, right: 20),
              width: 300,
              height: 70,
              child: const Text(
                "Progreso de tarea",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              margin: const EdgeInsets.only(top: 50, left: 120),
              width: 200,
              height: 45,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 188, 100),
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
              decoration: _cardBorders(),
              margin: const EdgeInsetsDirectional.only(top: 10),
              width: 500,
              height: 700,
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                width: 100,
                height: 80,
                decoration: _cardBorders(),
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.spaceAround,
                      spacing: 80.0,
                      children: [
                        SizedBox(
                          width: 330,
                          height: 60,
                          child: Text(
                            widget.task.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Text(
                        //   widget.points.toString(),
                        //   style: const TextStyle(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.blue),
                        //   textAlign: TextAlign.start,
                        // ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 150),
                      child: const Text(
                        "Objetivo",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      width: 340,
                      height: 200,
                      child: Text(
                        widget.task.description,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Button change state of type

                    Column(
                      children: [
                        Container(
                          width: 340,
                          height: 200,
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    "01",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.grey),
                                  ),
                                  Text("02",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.grey)),
                                  Text("03",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.grey)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  SizedBox(
                                    width: 250,
                                    height: 40,
                                    child: Text(
                                      "Maquetado",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 250,
                                    height: 40,
                                    child: Text(
                                      "Analisís de requerimientos",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text("Discovery",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.play_circle_fill_outlined,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.lock_rounded,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      width: 350,
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.40),
                              blurRadius: 10,
                            )
                          ]),
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Wrap(
                          alignment: WrapAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 220, 220),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.star_border,
                                size: 40,
                                color: Color.fromARGB(255, 255, 121, 64),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 60,
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
                                icon: const Icon(Icons.check,
                                    color: Colors.black),
                                label: const Text("Done",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  acept();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
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
