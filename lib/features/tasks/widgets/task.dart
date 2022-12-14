import 'package:smiley_app/common/widgets/loader.dart';

import 'package:smiley_app/features/account/services/account_services.dart';

import 'package:smiley_app/models/tasks.dart';
// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';

import '../screens/task_detail_screen.dart';
import 'single_task.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 330,
                padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: tasks!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TaskDetailsScreen.routeName,
                          arguments: tasks![index],
                        );
                      },
                      child: SingleTask(
                        task: tasks![index],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
