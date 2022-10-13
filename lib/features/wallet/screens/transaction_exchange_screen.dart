import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/transaction_form_provider.dart';
import '../services/productTransaction_service.dart';
import '../widgets/exchangeProduct_card.dart';

class ExchangeTransactionScreen extends StatefulWidget {
  ExchangeTransactionScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeTransactionScreen> createState() =>
      _ExchangeTransactionScreenState();
}

class _ExchangeTransactionScreenState extends State<ExchangeTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();

    final transactionService = Provider.of<ProductTransactionService>(context);

    return ChangeNotifierProvider(
      create: (_) =>
          TransactionFormProvider(transactionService.selectedTransaction),
      child: _ExchangeTransactionScreenBody(
          transactionService: transactionService),
    );
  }
}

class _ExchangeTransactionScreenBody extends StatefulWidget {
  _ExchangeTransactionScreenBody({
    Key? key,
    required this.transactionService,
  }) : super(key: key);

  ProductTransactionService transactionService;
  @override
  State<_ExchangeTransactionScreenBody> createState() =>
      _ExchangeTransactionScreenBodyState();
}

class _ExchangeTransactionScreenBodyState
    extends State<_ExchangeTransactionScreenBody> {
  @override
  Widget build(BuildContext context) {
    //PointService pointService;

    //final pointListProvider = Provider.of<PointListProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 250,
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Mis Gastos",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
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
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                //itemCount: taskListProvider.tasks.length,
                itemCount: widget.transactionService.transactions.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    widget.transactionService.selectedTransaction =
                        widget.transactionService.transactions[index].copy();
                    // Navigator.pushNamed(
                    //   context,
                    //   'pointPut',
                    // );
                  },
                  child: ExchangeProductTransactionCard(
                    transaction: widget.transactionService.transactions[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
