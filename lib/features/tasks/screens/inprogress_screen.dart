import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/task_inprogress_form_provider.dart';
import '../services/task_inprogress_service.dart';
import '../widgets/task_Inprogress_card.dart';

class TaskInprogressScreen extends StatefulWidget {
  TaskInprogressScreen({Key? key}) : super(key: key);

  @override
  State<TaskInprogressScreen> createState() => _TaskInprogressScreenState();
}

class _TaskInprogressScreenState extends State<TaskInprogressScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();
    final tasksService = Provider.of<TaskInprogressService>(context);

    return ChangeNotifierProvider(
      create: (_) => TaskInprogressFormProvider(tasksService.selectedTask),
      child: _TaskInprogressScreenBody(tasksService: tasksService),
    );
  }
}

class _TaskInprogressScreenBody extends StatefulWidget {
  _TaskInprogressScreenBody({
    Key? key,
    required this.tasksService,
  }) : super(key: key);

  TaskInprogressService tasksService;
  @override
  State<_TaskInprogressScreenBody> createState() =>
      _TaskInprogressScreenBodyState();
}

class _TaskInprogressScreenBodyState extends State<_TaskInprogressScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Material(
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            //itemCount: taskListProvider.tasks.length,
            itemCount: widget.tasksService.taskInprogress.length,

            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                widget.tasksService.selectedTask =
                    widget.tasksService.taskInprogress[index].copy();
                Navigator.pushNamed(
                  context,
                  'ProgresTaskInprogressView',
                );
              },
              child: TaskInprogressCard(
                taskInprogress: widget.tasksService.taskInprogress[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
