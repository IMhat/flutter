// import 'package:app_uteam/models/models.dart';

import 'package:amazon_clone/models/wallet.dart';
import 'package:flutter/material.dart';

class WalletHomeCard extends StatelessWidget {
  final Wallet wallet;

  const WalletHomeCard({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _UserDetails(
      //title: taskListProvider.tasks[i].title,
      // subTitle: taskListProvider.tasks[i].description,
      name: wallet.username,
      points: wallet.balance,
    );
  }

  // BoxDecoration _cardBorders() => BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(25),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
  //         ]);
}

class _UserDetails extends StatefulWidget {
  final dynamic name;
  final dynamic points;

  const _UserDetails({this.name, this.points});

  @override
  State<_UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<_UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Hello,",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white),
            ),
            Text(
              widget.name.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              const Text(
                "Tienes ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
              Text(
                widget.points.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
              const Text(
                " puntos ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // BoxDecoration _buildBoxDecoration() => const BoxDecoration(
  //     color: Colors.indigo,
  //     borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}
