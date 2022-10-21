import 'package:flutter/material.dart';
import '../widgets/BigText.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final LinearGradient _gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.center,
      colors: <Color>[
        Colors.deepPurple,
        Colors.red,
        Color.fromARGB(255, 169, 58, 183),
      ]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Color(0xffCFBDF8),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: 280,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 20),
                        Text(
                          "Canjea",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "puntos",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        MyButtonBeginning(),
                      ],
                    ),
                    Image.asset("assets/paint1.png"),
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xffCFBDF8),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  width: 310,
                  height: 150,
                  child: Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 120, left: 5),
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return _gradient.createShader(rect);
                        },
                        child: const Text(
                          "Reconocimientos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 90),
                        child: Image.asset("assets/paint2.png"))
                  ]))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          width: 300,
          height: 60,
          color: Colors.white,
          child: const Text(
            "Estado de desafios",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Divider(indent: 2, color: Color.fromARGB(255, 160, 159, 159)),
        Container(
          width: 300,
          height: 40,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Desafios",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
              ),
              Text(
                "Estado",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        const Divider(indent: 2, color: Color.fromARGB(255, 160, 159, 159)),
        Container(
          padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 10, left: 0, right: 15),
          width: 350,
          height: 300,
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: const BorderRadius.all(Radius.circular(10)),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey[850]!.withOpacity(0.29),
          //         offset: const Offset(-10, 10),
          //         blurRadius: 10,
          //       )
          //     ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          const Text(
                            "Marketing Page Redesign",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                width: 150,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 255, 251, 251)),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const Text(
                                "100 %",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 255, 251, 251)),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const Text("Finalizado"),
                            ],
                          ),
                          const Text(
                            "14 Mar",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle_outlined,
                        color: Colors.grey,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          const Text(
                            "Pitch Deck",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 244, 214, 214),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Stack(
                                  children: [
                                    LayoutBuilder(
                                        builder: (context, constraints) =>
                                            Container(
                                              width: constraints.maxWidth * 0.7,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 248, 118, 12),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            )),
                                    const Positioned.fill(
                                        child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                    ))
                                  ],
                                ),
                              ),
                              const Text(
                                "70 %",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 248, 118, 12),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 255, 251, 251)),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const Text("En progreso",
                                  style: TextStyle(color: Colors.orange)),
                            ],
                          ),
                          const Text(
                            "14 Mar",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle_outlined,
                        color: Colors.grey,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          const Text(
                            "New IOS Developement",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 240, 152, 152),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Stack(
                                  children: [
                                    LayoutBuilder(
                                        builder: (context, constraints) =>
                                            Container(
                                              width: constraints.maxWidth * 0.8,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 248, 12, 12),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            )),
                                    const Positioned.fill(
                                        child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                    ))
                                  ],
                                ),
                              ),
                              const Text(
                                "85 %",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 248, 12, 12),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 255, 251, 251)),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const Text(
                                "Vencido",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 248, 12, 12),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            "14 Mar",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        //   margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
        //   width: 300,
        //   height: 80,
        //   decoration: BoxDecoration(
        //       color: const Color.fromARGB(255, 231, 170, 209),
        //       borderRadius: const BorderRadius.all(Radius.circular(10)),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.grey[850]!.withOpacity(0.29),
        //           offset: const Offset(-10, 10),
        //           blurRadius: 10,
        //         )
        //       ]),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Container(
        //         child: ShaderMask(
        //           shaderCallback: (Rect rect) {
        //             return _gradient.createShader(rect);
        //           },
        //           child: const Text(
        //             "Desafios",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 30,
        //                 color: Colors.white),
        //           ),
        //         ),
        //       ),
        //       const MyButton()
        //     ],
        //   ),
        // )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: const Color.fromARGB(255, 137, 205, 236),
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: "Canjea Puntos",
                  color: Colors.black,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 100),
                  child: Column(
                    children: [
                      MaterialButton(
                        minWidth: 120.0,
                        height: 40.0,
                        onPressed: (() {}),
                        color: const Color.fromARGB(255, 251, 110, 2),
                        child: const Text(
                          "Empezar",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'ManageTasks',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),

        child: const Icon(
          Icons.arrow_forward,
          color: Colors.red,
        ),
        //child: const Text('My Button'),
      ),
    );
  }
}

class MyButtonBeginning extends StatelessWidget {
  const MyButtonBeginning({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'tienda',
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
          'Empezar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
