import 'package:amazon_clone/features/wallet/screens/transaction_exchange_screen.dart';
import 'package:amazon_clone/features/wallet/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/wallet_form_provider.dart';
import '../../home/services/wallet_services.dart';
import '../widgets/wallet_card.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();

    final walletService = Provider.of<WalletService>(context);

    return ChangeNotifierProvider(
      create: (_) => WalletFormProvider(walletService.selectedWallet),
      child: _WalletScreenBody(walletService: walletService),
    );
  }
}

class _WalletScreenBody extends StatefulWidget {
  _WalletScreenBody({
    Key? key,
    required this.walletService,
  }) : super(key: key);

  WalletService walletService;
  @override
  State<_WalletScreenBody> createState() => _WalletScreenBodyState();
}

class _WalletScreenBodyState extends State<_WalletScreenBody> {
  @override
  Widget build(BuildContext context) {
    //PointService pointService;

    //final pointListProvider = Provider.of<PointListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 250,
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Mi Billetera",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   width: 280,
            //   height: 120,
            //   decoration: const BoxDecoration(
            //       color: Color.fromARGB(255, 231, 170, 209),
            //       borderRadius: BorderRadius.all(Radius.circular(10))),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Text(
            //         "300 Puntos",
            //         style: TextStyle(
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           decorationColor: Colors.red,
            //         ),
            //         textAlign: TextAlign.center,
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 20, left: 50),
              width: 500,
              color: Colors.white,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  //itemCount: taskListProvider.tasks.length,
                  itemCount: widget.walletService.wallet.length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      widget.walletService.selectedWallet =
                          widget.walletService.wallet[index].copy();
                      // Navigator.pushNamed(
                      //   context,
                      //   'pointPut',
                      // );
                    },
                    child: WalletCard(
                      wallet: widget.walletService.wallet[index],
                    ),
                  ),
                ),
              ),
            ),
            TransactionScreen(),
            ExchangeTransactionScreen(),
          ],
        ),
      ),
    );
  }
}
