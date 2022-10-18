import 'package:flutter/material.dart';

import '../../../models/tasks.dart';

class MyTaskDetail extends StatefulWidget {
  final Task task;

  const MyTaskDetail({Key? key, required this.task}) : super(key: key);

  @override
  State<MyTaskDetail> createState() => _MyTaskDetailState();
}

class _MyTaskDetailState extends State<MyTaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _TaskDetails(
            //title: taskListProvider.tasks[i].title,
            // subTitle: taskListProvider.tasks[i].description,
            title: widget.task.title,
            subTitle: widget.task.description,
            // type: widget.task.type,
            points: widget.task.points,
            //user: widget.task.user,
          ),
        ],
      ),
    );
  }
}

class _TaskDetails extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final String? type;
  final String? user;
  final dynamic points;

  const _TaskDetails(
      {this.title, this.subTitle, this.type, this.points, this.user});

  @override
  State<_TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<_TaskDetails> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 5, right: 130),
              width: 350,
              height: 60,
              child: Text(
                widget.title.toString(),
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: 300,
              height: 40,
              child: const Text(
                "Desarrollo de UX",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20),
                width: 400,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Para"),
                    Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(
                        children: [
                          LayoutBuilder(
                              builder: (context, constraints) => Container(
                                    width: constraints.maxWidth * 10,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 199, 197, 198),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  )),
                          Positioned.fill(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                ),
                                Text(
                                  widget.user.toString(),
                                ),
                                const Icon(Icons.close)
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    const Text("en"),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      width: 120,
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
                  ],
                )),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: 340,
              height: 200,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 0, 21, 255)),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                widget.subTitle.toString(),
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.only(left: 0),
                width: 500,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage("assets/tareaasignada.jpg")),
                    Container(
                      width: 150,
                      height: 45,
                      child: Column(
                        children: [
                          const Text(
                            "Team-fotos.jpg",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.user.toString(),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const Text("34 MB"),
                    ElevatedButton(
                      style: buttonStyleDowload,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '',
                        );
                      },
                      child: const Text("Dowload"),
                    ),
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(left: 0),
                width: 500,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Aa",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    Icon(Icons.emoji_emotions_outlined),
                    Icon(Icons.attach_file),
                    Icon(Icons.today_outlined),
                    Text(
                      "vence 10/10/22",
                      style: TextStyle(color: Colors.red),
                    ),
                    Icon(Icons.person_add)
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Text(
                    widget.points.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 27, 112, 248),
                    ),
                  ),
                  const Text(
                    " Puntos",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 112, 248)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  width: 280,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 138, 138, 139)),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Comentarios...",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 250),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '',
                  );
                },
                child: const Text("Enviar"),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
