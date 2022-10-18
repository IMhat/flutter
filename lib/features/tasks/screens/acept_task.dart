// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../providers/task_form_provider.dart';
// import '../services/task_services.dart';
// import '../widgets/buttonaceptreject.dart';
// import '../widgets/task_detail.dart';

// class AceptTaskScreen extends StatefulWidget {
//   AceptTaskScreen({Key? key}) : super(key: key);

//   @override
//   State<AceptTaskScreen> createState() => _AceptTaskScreenState();
// }

// class _AceptTaskScreenState extends State<AceptTaskScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // DBProvider.db.database;
//     // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
//     // DBProvider.db.nuevaTask(tempTask);
//     // print(tempTask);
//     // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

//     //DBProvider.db.getTodasLasTasks().then((print));
//     //DBProvider.db.deleteAllTasks();
//     final tasksService = Provider.of<TaskService>(context);
//     return ChangeNotifierProvider(
//       create: (_) => TaskFormProvider(tasksService.selectedTask),
//       child: _ManageTaskScreenBody(tasksService: tasksService),
//     );
//   }
// }

// class _ManageTaskScreenBody extends StatefulWidget {
//   _ManageTaskScreenBody({
//     Key? key,
//     required this.tasksService,
//   }) : super(key: key);

//   TaskService tasksService;
//   @override
//   State<_ManageTaskScreenBody> createState() => _ManageTaskScreenBodyState();
// }

// class _ManageTaskScreenBodyState extends State<_ManageTaskScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             MyTaskDetail(task: widget.tasksService.selectedTask),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: 260,
//                 height: 50,
//                 margin: const EdgeInsets.only(
//                     top: 10, left: 30, right: 30, bottom: 0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.white,
//                     boxShadow: const [
//                       BoxShadow(
//                           color: Color.fromARGB(135, 144, 142, 142),
//                           blurRadius: 10.0,
//                           offset: Offset(0, 5)),
//                       BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
//                       BoxShadow(color: Colors.white, offset: Offset(5, 0))
//                     ]),
//                 child: Container(
//                     padding: const EdgeInsets.only(top: 5, left: 25, bottom: 5),
//                     child: ButtonsAceptReject(
//                         task: widget.tasksService.selectedTask)),
//               ),
//             ),
//           ],
//         ));
//   }
// }
