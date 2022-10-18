// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../providers/task_inprogress_form_provider.dart';
// import '../services/task_inprogress_service.dart';
// import 'progress_taskInprogress.dart';

// class ProgresTaskInprogressView extends StatefulWidget {
//   ProgresTaskInprogressView({Key? key}) : super(key: key);

//   @override
//   State<ProgresTaskInprogressView> createState() =>
//       _ProgresTaskInprogressViewState();
// }

// class _ProgresTaskInprogressViewState extends State<ProgresTaskInprogressView> {
//   @override
//   Widget build(BuildContext context) {
//     // DBProvider.db.database;
//     // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
//     // DBProvider.db.nuevaTask(tempTask);
//     // print(tempTask);
//     // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

//     //DBProvider.db.getTodasLasTasks().then((print));
//     //DBProvider.db.deleteAllTasks();
//     final tasksService = Provider.of<TaskInprogressService>(context);
//     return ChangeNotifierProvider(
//       create: (_) => TaskInprogressFormProvider(tasksService.selectedTask),
//       child: _ProgresTaskInprogressViewBody(tasksService: tasksService),
//     );
//   }
// }

// class _ProgresTaskInprogressViewBody extends StatefulWidget {
//   _ProgresTaskInprogressViewBody({
//     Key? key,
//     required this.tasksService,
//   }) : super(key: key);

//   TaskInprogressService tasksService;
//   @override
//   State<_ProgresTaskInprogressViewBody> createState() =>
//       _ProgresTaskInprogressViewBodyState();
// }

// class _ProgresTaskInprogressViewBodyState
//     extends State<_ProgresTaskInprogressViewBody> {
//   @override
//   Widget build(BuildContext context) {
//     return ProgresTaskInprogress(
//         taskInprogress: widget.tasksService.selectedTask);
//   }
// }
