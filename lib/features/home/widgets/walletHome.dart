import 'package:amazon_clone/models/wallet.dart';
import 'package:flutter/material.dart';

class WalletHome extends StatelessWidget {
  final Wallet wallet;
  const WalletHome({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _WalletDetails(
      //title: taskListProvider.tasks[i].title,
      // subTitle: taskListProvider.tasks[i].description,
      name: wallet.name,
      points: wallet.balance,
    );
  }
}

class _WalletDetails extends StatefulWidget {
  final dynamic name;
  final dynamic points;

  const _WalletDetails({this.name, this.points});

  @override
  State<_WalletDetails> createState() => _WalletDetailsState();
}

class _WalletDetailsState extends State<_WalletDetails> {
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
            SizedBox(
              width: 180,
              height: 40,
              child: Text(
                widget.name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
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
