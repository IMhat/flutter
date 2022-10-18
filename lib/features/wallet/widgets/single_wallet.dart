import 'package:amazon_clone/models/wallet.dart';
import 'package:flutter/material.dart';

class SingleWallet extends StatelessWidget {
  final Wallet wallet;
  const SingleWallet({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _WalletDetails(
                //title: taskListProvider.tasks[i].title,
                // subTitle: taskListProvider.tasks[i].description,
                name: wallet.username,
                points: wallet.balance,
              ),
            ],
          ),
        ),
      ),
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
  final LinearGradient _gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        (Color(0xff7F00F0)),
        Color.fromARGB(255, 165, 92, 179),
        Color.fromARGB(255, 247, 90, 98)
      ]);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 300,
        height: 200,
        decoration: const BoxDecoration(
          color: Color(0xffCFBDF8),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect rect) {
                return _gradient.createShader(rect);
              },
              child: Text(
                widget.name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect rect) {
                return _gradient.createShader(rect);
              },
              child: Text(
                widget.points.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect rect) {
                return _gradient.createShader(rect);
              },
              child: const Text(
                "Puntos",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BoxDecoration _buildBoxDecoration() => const BoxDecoration(
  //     color: Colors.indigo,
  //     borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}
