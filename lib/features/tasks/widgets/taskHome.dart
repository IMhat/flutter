import 'package:smiley_app/common/widgets/loader.dart';

import 'package:smiley_app/features/account/services/account_services.dart';

import 'package:smiley_app/models/tasks.dart';
// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';

class TasksCounter extends StatefulWidget {
  const TasksCounter({Key? key}) : super(key: key);

  @override
  State<TasksCounter> createState() => _TasksCounterState();
}

class _TasksCounterState extends State<TasksCounter> {
  // temporary list
  List<Task>? tasks;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    tasks = await accountServices.fetchMyBacklogTask(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const Loader()
        : SingleChildScrollView(
            child: Column(
              children: [
                // DISPLAY ORDERS
                Container(
                  child: Wrap(children: [
                    Text(
                      tasks!.length.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      " desafíos",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ]),
                )
              ],
            ),
          );
  }
}
