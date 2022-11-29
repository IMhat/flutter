import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/login_form_provider.dart';
import '../widgets/card_cointainer.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);
  final LinearGradient _gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 247, 90, 98),
        Color.fromARGB(255, 165, 92, 179),
        (Color.fromARGB(255, 159, 36, 235)),
      ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            width: 400,
            height: 100,
            color: Colors.white,
            // child: Image.asset("assets/logouteam.png")
          ),
          const SizedBox(height: 20),
          Container(
            width: 250,
            height: 80,
            color: Colors.white,
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return _gradient.createShader(rect);
              },
              child: const SizedBox(
                width: 250,
                child: Text(
                  "Crea tu cuenta para ganar puntos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // child: const Text(
            //   "Crea tu cuenta para ganar puntos",
            //   style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //       color: Color(0xff5D4FB1)),
            //   textAlign: TextAlign.center,
            // ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0),
            width: 250,
            height: 80,
            color: Colors.white,
            child: const Text(
              "Con la app podrás registrarte y obtener puntos por objetivos semanales",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 194, 194, 194)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(children: [
            ChangeNotifierProvider(
                create: (_) => LoginFormProvider(), child: _InitialScreenForm())
          ]),
        ],
      )),
    );
  }
}

class _InitialScreenForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: const [
            SizedBox(
              height: 50,
            ),
            MyButtonInit(),
            // MaterialButton(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     disabledColor: Colors.grey,
            //     elevation: 0,
            //     color: Color.fromARGB(255, 218, 179, 231),
            //     child: Container(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 20, vertical: 15),
            //         child: const Text(
            //           'Log in',
            //           style: TextStyle(
            //             color: Color(0xff5D4FB1),
            //           ),
            //         )),
            //     onPressed: () {
            //       if (!loginForm.isValidForm()) return;
            //       Navigator.pushReplacementNamed(context, 'login');
            //     })
          ],
        ));
  }
}

class MyButtonInit extends StatelessWidget {
  const MyButtonInit({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'AuthPage',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 140,
        height: 50,
        decoration: BoxDecoration(
          gradient:
              const LinearGradient(begin: AlignmentDirectional.topEnd, colors: [
            Color.fromARGB(255, 242, 133, 157),
            Color.fromARGB(255, 137, 65, 173),
          ]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Registrarte',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
