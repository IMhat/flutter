import 'package:smiley_app/common/widgets/loader.dart';

import 'package:smiley_app/features/account/services/account_services.dart';

import 'package:smiley_app/features/wallet/widgets/single_wallet.dart';
import 'package:smiley_app/features/home/widgets/walletHome.dart';
// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:smiley_app/models/wallet.dart';
import 'package:flutter/material.dart';

class Walletss extends StatefulWidget {
  const Walletss({Key? key}) : super(key: key);

  @override
  State<Walletss> createState() => _WalletsState();
}

class _WalletsState extends State<Walletss> {
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
                height: 80,
                width: 280,
                padding: const EdgeInsets.only(top: 20, right: 20),
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
                      child: WalletHome(
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
