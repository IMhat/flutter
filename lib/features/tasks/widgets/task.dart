import 'package:smiley_app/common/widgets/loader.dart';

import 'package:smiley_app/features/account/services/account_services.dart';

import 'package:smiley_app/models/tasks.dart';
// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';

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
        : SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       padding: const EdgeInsets.only(left: 15),
                //       child: const Text(
                //         'Your Wallet',
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ),
                //     // Container(
                //     //   padding: const EdgeInsets.only(right: 15),
                //     //   child: Text(
                //     //     'See all',
                //     //     style: TextStyle(
                //     //       color: GlobalVariables.selectedNavBarColor,
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),

                // DISPLAY ORDERS
                Container(
                  height: 900,
                  width: 350,
                  padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: tasks!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   'AceptTasks',
                          // );
                        },
                        child: SingleTask(
                          task: tasks![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
