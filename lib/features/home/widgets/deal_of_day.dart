import 'package:smiley_app/common/widgets/loader.dart';
import 'package:smiley_app/features/home/services/home_services.dart';
import 'package:smiley_app/features/product_details/screens/product_details_screen.dart';
import 'package:smiley_app/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: const Text(
                        'Deal of the day',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.black12.withOpacity(0.08),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 250, 249, 249),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(134, 56, 56, 56),
                                blurRadius: 10.0,
                                offset: Offset(0, 5)),
                            BoxShadow(
                              color: Color.fromARGB(255, 233, 232, 232),
                            ),
                          ]),
                      child: Image.network(
                        product!.images[0],
                        height: 235,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 53, top: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Points: ${product!.price}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 117, 117, 117)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 53, top: 5),
                      child: Text(
                        product!.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.black12.withOpacity(0.08),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.fitWidth,
                                width: 100,
                                height: 100,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        right: 15,
                        top: 15,
                        bottom: 15,
                      ),
                      alignment: Alignment.topRight,
                      child: Text(
                        'See all deals',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
