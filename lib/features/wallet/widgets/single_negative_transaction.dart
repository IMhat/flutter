import 'package:smiley_app/models/transaction_Negative.dart';
import 'package:flutter/material.dart';

class SingleNegativeTransaction extends StatelessWidget {
  final negativeTransaction transaction;
  const SingleNegativeTransaction({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _UserDetails(
            //title: taskListProvider.tasks[i].title,
            // subTitle: taskListProvider.tasks[i].description,
            name: transaction.trnxSummary,
            points: transaction.amount,
            summary: transaction.summary,
          ),
        ],
      ),
    );
  }
}

class _UserDetails extends StatefulWidget {
  final dynamic name;
  final dynamic points;
  final dynamic summary;

  const _UserDetails({this.name, this.points, this.summary});

  @override
  State<_UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<_UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 330,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[850]!.withOpacity(0.29),
                offset: const Offset(-10, 10),
                blurRadius: 10,
              )
            ]),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 200, 198, 198),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[850]!.withOpacity(0.29),
                      offset: const Offset(-10, 10),
                      blurRadius: 10,
                    )
                  ]),
              child: const Icon(
                Icons.credit_card,
                size: 30,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name.toString(),
                  style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Text("Gastaste"),
                    const SizedBox(width: 5),
                    Text(
                      widget.points.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 5),
                    const Text("Puntos"),
                  ],
                ),
                Text(
                  widget.summary.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
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
