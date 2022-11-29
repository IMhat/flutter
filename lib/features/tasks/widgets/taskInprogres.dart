import 'package:smiley_app/common/widgets/loader.dart';

import 'package:smiley_app/features/account/services/account_services.dart';
import 'package:smiley_app/models/task_inprogress.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';

import '../screens/task_inprogress_detail_screen.dart';
import 'single_task_inprogress.dart';

class TasksInprogres extends StatefulWidget {
  const TasksInprogres({Key? key}) : super(key: key);

  @override
  State<TasksInprogres> createState() => _TasksInprogresState();
}

class _TasksInprogresState extends State<TasksInprogres> {
  // temporary list
  List<TaskInprogress>? tasks;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    tasks = await accountServices.fetchMyInprogressTask(context: context);
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
                          TaskInprogressDetailsScreen.routeName,
                          arguments: tasks![index],
                        );
                      },
                      child: SingleTaskInprogress(
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
