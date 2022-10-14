import 'package:amazon_clone/features/home/widgets/button_back_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/task_inprogress.dart';
import '../../../providers/task_inprogress_form_provider.dart';
import '../services/task_inprogress_service.dart';

class ProgresTaskInprogress extends StatefulWidget {
  final TaskInprogress taskInprogress;

  const ProgresTaskInprogress({Key? key, required this.taskInprogress})
      : super(key: key);

  @override
  State<ProgresTaskInprogress> createState() => _ProgresTaskInprogressState();
}

class _ProgresTaskInprogressState extends State<ProgresTaskInprogress> {
  @override
  Widget build(BuildContext context) {
    final taskServiceProvider = Provider.of<TaskInprogressService>(context);
    final taskForm = Provider.of<TaskInprogressFormProvider>(context);

    return Container(
      //decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _TaskProgres(
            //title: taskListProvider.tasks[i].title,
            // subTitle: taskListProvider.tasks[i].description,
            title: widget.taskInprogress.title,
            subTitle: widget.taskInprogress.description,
            type: widget.taskInprogress.type,
            points: widget.taskInprogress.points,
            user: widget.taskInprogress.user,
            //change state of type
            onTap: () {
              setState(() {
                widget.taskInprogress.type = "done";

                widget.taskInprogress.type = "done";
                taskServiceProvider.updateTask(widget.taskInprogress);
              });

              // widget.task.type = "done";
              // taskServiceProvider.updateTask(taskForm.task.done);
            },
          ),
        ],
      ),
    );
  }
}

class _TaskProgres extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final dynamic type;
  final String? user;
  final dynamic points;

  const _TaskProgres(
      {required this.onTap,
      this.title,
      this.subTitle,
      this.type,
      this.points,
      this.user});
  final VoidCallback onTap; //change state of type
  @override
  State<_TaskProgres> createState() => _TaskProgresState();
}

class _TaskProgresState extends State<_TaskProgres> {
  final elevatedButtonStyle = ElevatedButton.styleFrom(
      shadowColor: const Color.fromARGB(255, 54, 57, 244),
      elevation: 10,
      primary: Colors.deepPurple,
      onPrimary: Colors.white);

  final buttonStyleDowload = ElevatedButton.styleFrom(
      elevation: 0,
      primary: const Color.fromARGB(255, 255, 255, 255),
      onPrimary: const Color.fromARGB(255, 0, 34, 255));

  @override
  Widget build(BuildContext context) {
    final taskServiceProvider = Provider.of<TaskInprogressService>(context);
    return ChangeNotifierProvider(
      create: (_) => taskServiceProvider,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 114, 110),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 50, right: 250),
                  child: Wrap(
                    children: const [
                      Text("Back to home"),
                      MyButtonBackHome(),
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
                    color: Colors.green,
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 251, 251)),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  widget.type.toString(),
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
                            width: 150,
                            height: 60,
                            child: Text(
                              widget.title.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            widget.points.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                            textAlign: TextAlign.start,
                          ),
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
                        padding:
                            const EdgeInsets.only(top: 0, left: 5, right: 5),
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        width: 340,
                        height: 200,
                        child: Text(
                          widget.subTitle.toString(),
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
                                  color:
                                      const Color.fromARGB(255, 247, 220, 220),
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
                                    setState(() {
                                      widget.onTap();
                                    });
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

class MyButtonGaming extends StatelessWidget {
  const MyButtonGaming({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          '',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: AlignmentDirectional.topEnd,
              colors: [
                Color.fromARGB(255, 242, 133, 157),
                Color.fromARGB(255, 167, 79, 211)
              ]),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Gaming',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
