import 'package:amazon_clone/features/tasks/widgets/taskInprogres.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/task_form_provider.dart';

import '../widgets/task.dart';

import '../widgets/taskDone.dart';
import 'inprogress_screen.dart';
import 'task_done_screen.dart';

class ManageTaskScreen extends StatefulWidget {
  const ManageTaskScreen({Key? key}) : super(key: key);

  @override
  State<ManageTaskScreen> createState() => _ManageTaskScreenState();
}

class _ManageTaskScreenState extends State<ManageTaskScreen>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 3, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  final textStyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.deepPurple))),
            child: Material(
              color: Colors.white,
              child: TabBar(
                controller: controller,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.only(top: 8, left: 15),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(166, 239, 41, 27),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.29),
                              offset: const Offset(-10, 10),
                              blurRadius: 10,
                            )
                          ]),
                      child: Text("Backlog", style: textStyle),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: (const Color(0xffF2994A)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.29),
                              offset: const Offset(-10, 10),
                              blurRadius: 10,
                            )
                          ]),
                      child: Text("In Progress", style: textStyle),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.only(top: 8, left: 25),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 124, 199, 127),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.29),
                              offset: const Offset(-10, 10),
                              blurRadius: 10,
                            )
                          ]),
                      child: Text(
                        "Done",
                        style: textStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controller,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 5, left: 20, bottom: 20),
                  color: Colors.white,
                  child: Tasks()),
              //),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                child: TasksInprogres(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                child: TasksDone(),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

Future<void> _refresh() {
  return Future.delayed(const Duration(seconds: 0));
}

// Container(
//   padding: const EdgeInsets.only(
//     top: 10,
//   ),
//   width: 100,
//   height: 45,
//   decoration: BoxDecoration(
//       color: Colors.green,
//       border: Border.all(
//           color:
//               const Color.fromARGB(255, 255, 251, 251)),
//       borderRadius: BorderRadius.circular(50)),
//   child: const Text(
//     "All",
//     style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Color.fromARGB(255, 0, 0, 0)),
//     textAlign: TextAlign.center,
//   ),
// ),
// Container(
//   padding: const EdgeInsets.only(
//     top: 10,
//   ),
//   width: 120,
//   height: 45,
//   decoration: BoxDecoration(
//       color: const Color.fromARGB(255, 255, 98, 0),
//       border: Border.all(
//           color:
//               const Color.fromARGB(255, 255, 251, 251)),
//       borderRadius: BorderRadius.circular(50)),
//   child: const Text(
//     "En progreso",
//     style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Color.fromARGB(255, 0, 0, 0)),
//     textAlign: TextAlign.center,
//   ),
// ),
// Container(
//   padding: const EdgeInsets.only(
//     top: 10,
//   ),
//   width: 120,
//   height: 45,
//   decoration: BoxDecoration(
//       color: Colors.green,
//       border: Border.all(
//           color:
//               const Color.fromARGB(255, 255, 251, 251)),
//       borderRadius: BorderRadius.circular(50)),
//   child: const Text(
//     "Finalizado",
//     style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Color.fromARGB(255, 0, 0, 0)),
//     textAlign: TextAlign.center,
//   ),
// ),




