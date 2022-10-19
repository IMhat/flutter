import 'package:smiley_app/common/widgets/loader.dart';

import 'package:smiley_app/features/account/services/account_services.dart';
import 'package:smiley_app/models/transaction_Negative.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';

import 'single_negative_transaction.dart';

class TransactionNegative extends StatefulWidget {
  const TransactionNegative({Key? key}) : super(key: key);

  @override
  State<TransactionNegative> createState() => _TransactionNegativeState();
}

class _TransactionNegativeState extends State<TransactionNegative> {
  // temporary list
  List<negativeTransaction>? transaction;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    transaction = await accountServices.fetchMyWalletNegativeTransaction(
        context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return transaction == null
        ? const Loader()
        : Column(
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
                height: 250,
                width: 350,
                padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: transaction!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   OrderDetailScreen.routeName,
                        //   arguments: wallet![index],
                        // );
                      },
                      child: SingleNegativeTransaction(
                        transaction: transaction![index],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
