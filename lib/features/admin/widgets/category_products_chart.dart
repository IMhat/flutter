import 'package:smiley_app/features/admin/model/sales.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<charts.Series<Sales, String>> seriesList;

  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: charts.BarChart(
        seriesList,
        animate: true,
      ),
    );
  }
}
