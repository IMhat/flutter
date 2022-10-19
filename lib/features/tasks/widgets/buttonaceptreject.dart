import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tasks.dart';

class ButtonsAceptReject extends StatelessWidget {
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
