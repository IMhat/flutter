import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tasks.dart';
import '../services/task_services.dart';

class ButtonsAceptReject extends StatefulWidget {
  final Task task;

  const ButtonsAceptReject({Key? key, required this.task}) : super(key: key);

  @override
  State<ButtonsAceptReject> createState() => _ButtonsAceptRejectState();
}

class _ButtonsAceptRejectState extends State<ButtonsAceptReject> {
  @override
  Widget build(BuildContext context) {
    final taskServiceProvider = Provider.of<TaskService>(context);

    return _ButtonsAceptReject(
      //title: taskListProvider.tasks[i].title,
      // subTitle: taskListProvider.tasks[i].description,
      title: widget.task.title,
      subTitle: widget.task.description,
      type: widget.task.type,
      points: widget.task.points,
      user: widget.task.user,
      //change state of type
      onTapAcept: () {
        setState(() {
          widget.task.type = "inprogress";
          //print("mundo");
          widget.task.type = "inprogress";
          taskServiceProvider.updateTask(widget.task);
        });

        // widget.task.type = "done";
        // taskServiceProvider.updateTask(taskForm.task.done);
        Navigator.of(context).pushNamed('ChallengeAcepted');
      },
      onTapReject: () {
        setState(() {
          widget.task.type = "ToDo";
          //print("mundo");
          widget.task.type = "ToDo";
          taskServiceProvider.updateTask(widget.task);
          Navigator.of(context).pushNamed('ManageTasks');
        });

        // widget.task.type = "done";
        // taskServiceProvider.updateTask(taskForm.task.done);
      },
    );
  }
}

class _ButtonsAceptReject extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final dynamic type;
  final String? user;
  final dynamic points;

  const _ButtonsAceptReject(
      {required this.onTapAcept,
      required this.onTapReject,
      this.title,
      this.subTitle,
      this.type,
      this.points,
      this.user});
  final VoidCallback onTapAcept;
  final VoidCallback onTapReject; //change state of type
  @override
  State<_ButtonsAceptReject> createState() => _TaskProgresState();
}

class _TaskProgresState extends State<_ButtonsAceptReject> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: AlignmentDirectional.topEnd,
                colors: [
                  Color.fromARGB(255, 242, 133, 157),
                  Color.fromARGB(255, 167, 79, 211),
                ]),
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'ChallengeAcepted',
              );
              setState(() {
                widget.onTapAcept();
              });
            },
            child: const Text(
              "Aceptar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 100,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: AlignmentDirectional.topEnd,
                colors: [
                  Color.fromARGB(255, 242, 164, 133),
                  Color.fromARGB(255, 255, 0, 0),
                ]),
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'ChallengeAcepted',
              );
              setState(() {
                widget.onTapReject();
              });
            },
            child: const Text(
              "Rechazar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

// class ButtonsAceptReject extends StatelessWidget {
//   const ButtonsAceptReject({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: const [
//         //MyButtonAcept(), MyButtonReject()
//         ],
//     );
//   }
// }

// class MyButtonAcept extends StatelessWidget {
//   const MyButtonAcept({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // The GestureDetector wraps the button.
//     return GestureDetector(
//       // When the child is tapped, show a snackbar.
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           'ChallengeAcepted',
//         );
//       },
//       // The custom button
//       child: Container(
//         padding: const EdgeInsets.all(7.0),
//         width: 90,
//         height: 35,
//         decoration: BoxDecoration(
//           gradient:
//               const LinearGradient(begin: AlignmentDirectional.topEnd, colors: [
//             Color.fromARGB(255, 242, 133, 157),
//             Color.fromARGB(255, 167, 79, 211),
//           ]),
//           borderRadius: BorderRadius.circular(3.0),
//         ),
//         child: const Text(
//           'Aceptar',
//           style: TextStyle(color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }

// class MyButtonReject extends StatelessWidget {
//   const MyButtonReject({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // The GestureDetector wraps the button.
//     return TextButton(onPressed: (){},
//      child:
//       // The custom button
//        Container(
//         padding: const EdgeInsets.all(7.0),
//         width: 90,
//         height: 35,
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.circular(3.0),
//         ),
//         child: const Text(
//           'Rechazar',
//           style: TextStyle(color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }

// Navigator.pushNamed(
//           context,
//           'ChallengeAcepted',
}
