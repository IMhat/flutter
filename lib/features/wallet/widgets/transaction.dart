import 'package:smiley_app/common/widgets/loader.dart';

import 'package:smiley_app/features/account/services/account_services.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';

import '../../../models/transaction.dart';
import 'single_positive_transaction.dart';

class TransactionPositive extends StatefulWidget {
  const TransactionPositive({Key? key}) : super(key: key);

  @override
  State<TransactionPositive> createState() => _TransactionPositiveState();
}

class _TransactionPositiveState extends State<TransactionPositive> {
  // temporary list
  List<Transaction>? transaction;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    transaction =
        await accountServices.fetchMyWalletTransaction(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return transaction == null
        ? const Loader()
        : ListView.builder(
            shrinkWrap: true,
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
                child: SinglePositiveTransaction(
                  transaction: transaction![index],
                ),
              );
            },
          );
  }
}
