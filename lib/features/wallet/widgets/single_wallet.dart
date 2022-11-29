import 'package:smiley_app/models/wallet.dart';
import 'package:flutter/material.dart';

class SingleWallet extends StatelessWidget {
  final Wallet wallet;
  const SingleWallet({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _WalletDetails(
      //title: taskListProvider.tasks[i].title,
      // subTitle: taskListProvider.tasks[i].description,
      name: wallet.username,
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 250,
      height: 80,
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
            child: SizedBox(
              width: 250,
              child: Text(
                widget.name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ShaderMask(
            shaderCallback: (Rect rect) {
              return _gradient.createShader(rect);
            },
            child: Wrap(children: [
              Text(
                widget.points.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const SizedBox(width: 5),
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
            ]),
          ),
        ],
      ),
    );
  }

  // BoxDecoration _buildBoxDecoration() => const BoxDecoration(
  //     color: Colors.indigo,
  //     borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}
