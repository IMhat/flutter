// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../providers/task_done_form_provider.dart';
// import '../services/task_done_service.dart';
// import '../widgets/tasks_done_card.dart';

// class TaskDoneScreen extends StatefulWidget {
//   TaskDoneScreen({Key? key}) : super(key: key);

//   @override
//   State<TaskDoneScreen> createState() => _TaskDoneScreenState();
// }

// class _TaskDoneScreenState extends State<TaskDoneScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // DBProvider.db.database;
//     // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
//     // DBProvider.db.nuevaTask(tempTask);
//     // print(tempTask);
//     // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

//     //DBProvider.db.getTodasLasTasks().then((print));
//     //DBProvider.db.deleteAllTasks();
//     final tasksService = Provider.of<TaskDoneService>(context);

//     return ChangeNotifierProvider(
//       create: (_) => TaskDoneFormProvider(tasksService.selectedTask),
//       child: _TaskDoneScreenBody(tasksService: tasksService),
//     );
//   }
// }

// class _TaskDoneScreenBody extends StatefulWidget {
//   _TaskDoneScreenBody({
//     Key? key,
//     required this.tasksService,
//   }) : super(key: key);

//   TaskDoneService tasksService;
//   @override
//   State<_TaskDoneScreenBody> createState() => _TaskDoneScreenBodyState();
// }

// class _TaskDoneScreenBodyState extends State<_TaskDoneScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Center(
//           child: ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             //itemCount: taskListProvider.tasks.length,
//             itemCount: widget.tasksService.tasksDone.length,

//             itemBuilder: (BuildContext context, int index) => GestureDetector(
//               onTap: () {
//                 widget.tasksService.selectedTask =
//                     widget.tasksService.tasksDone[index].copy();
//                 // Navigator.pushNamed(
//                 //   context,
//                 //   'AceptTasks',
//                 // );
//               },
//               child: TaskDoneCard(
//                 tasksDone: widget.tasksService.tasksDone[index],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
