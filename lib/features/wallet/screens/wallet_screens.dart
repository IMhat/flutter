import 'package:flutter/material.dart';

import '../widgets/wallet.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  @override
  int selectedPage = 0;
  TabController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        TabController(length: 2, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //PointService pointService;

    //final pointListProvider = Provider.of<PointListProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Mi Billetera",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 0, left: 50),
            width: 500,
            color: Colors.white,
            child: Column(
              children: [
                Wallets(),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.deepPurple))),
            child: Material(
              color: Colors.white,
              child: TabBar(
                controller: controller,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(top: 8, left: 30),
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.29),
                              offset: const Offset(-10, 10),
                              blurRadius: 10,
                            )
                          ]),
                      child: Text("Mis ingresos"),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(top: 8, left: 40),
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.29),
                              offset: const Offset(-10, 10),
                              blurRadius: 10,
                            )
                          ]),
                      child: Text("Mis Gastos"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controller,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                  child: Text("ingresos")),
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                  child: Text("gastos")),
            ],
          ))
        ],
      ),
    );
  }
}



//     Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               width: 250,
//               child: Container(
//                 margin: const EdgeInsets.only(top: 0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Mi Billetera",
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 40, bottom: 20, left: 50),
//               width: 500,
//               color: Colors.white,
//               child: Center(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   //itemCount: taskListProvider.tasks.length,
//                   itemCount: widget.walletService.wallet.length,
//                   itemBuilder: (BuildContext context, int index) =>
//                       GestureDetector(
//                     onTap: () {
//                       widget.walletService.selectedWallet =
//                           widget.walletService.wallet[index].copy();
//                       // Navigator.pushNamed(
//                       //   context,
//                       //   'pointPut',
//                       // );
//                     },
//                     child: WalletCard(
//                       wallet: widget.walletService.wallet[index],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(width: 1, color: Colors.deepPurple))),
//               child: Material(
//                 color: Colors.white,
//                 child: TabBar(
//                   controller: controller,
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Colors.grey,
//                   tabs: [
//                     Tab(
//                       child: Container(
//                         child: Text("Backlog"),
//                       ),
//                     ),
//                     Tab(
//                       child: Container(
//                         child: Text("In Progress"),
//                       ),
//                     ),
//                     Tab(
//                       child: Container(
//                         child: Text("Done"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Expanded(
//             //     child: TabBarView(
//             //   controller: controller,
//             //   children: [
//             //     Container(
//             //         margin:
//             //             const EdgeInsets.only(top: 30, left: 20, bottom: 20),
//             //         child: TransactionScreen()),
//             //     Container(
//             //         margin:
//             //             const EdgeInsets.only(top: 30, left: 20, bottom: 20),
//             //         child: ExchangeTransactionScreen()),
//             //   ],
//             // ))
//           ],
//         ),
//       ),
//     );
//   }
// }
