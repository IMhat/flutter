import 'package:smiley_app/common/widgets/loader.dart';

import 'package:smiley_app/features/account/services/account_services.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:smiley_app/models/wallet.dart';
import 'package:flutter/material.dart';

import 'single_wallet.dart';

class Wallets extends StatefulWidget {
  const Wallets({Key? key}) : super(key: key);

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  // temporary list
  List<Wallet>? wallet;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    wallet = await accountServices.fetchMyWallet(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return wallet == null
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
                height: 150,
                width: 200,
                padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: wallet!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   OrderDetailScreen.routeName,
                        //   arguments: wallet![index],
                        // );
                      },
                      child: SingleWallet(
                        wallet: wallet![index],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
