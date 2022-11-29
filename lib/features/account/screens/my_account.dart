import 'package:smiley_app/features/account/widgets/button_my_orders.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../services/account_services.dart';
import '../widgets/account_button.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Cuenta',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30.0,
              backgroundColor: Color.fromARGB(255, 225, 223, 223),
              backgroundImage: AssetImage('assets/user.png'),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                width: 400,
                height: 500,
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 0, bottom: 20),
                      width: 100,
                      height: 80,
                      decoration: _cardBorders(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          MyButtonOrders(),
                          Icon(Icons.pending),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0, bottom: 20),
                      width: 100,
                      height: 80,
                      decoration: _cardBorders(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "Edit Account",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0, bottom: 20),
                      width: 100,
                      height: 80,
                      decoration: _cardBorders(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "Settings and Privacy",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.settings)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0, bottom: 20),
                      width: 100,
                      height: 80,
                      decoration: _cardBorders(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AccountButton(
                            text: 'Log Out',
                            onTap: () => AccountServices().logOut(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () => Navigator.pushNamed(context, 'usersPost'),
      // )
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[850]!.withOpacity(0.29),
            offset: const Offset(-10, 15),
            blurRadius: 10,
          )
        ]);
