import 'dart:convert';
// import 'package:app_uteam/models/models.dart';

// import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/buyProduct.dart';

class BuyProductService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';

  List<BuyProduct> transactions = [];

  late BuyProduct selectedTransaction;

  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  BuyProductService() {
    // _dbProvider = DBProvider();
    loadTransaction();
  }

  Future<List<BuyProduct>> loadTransaction() async {
    isLoading = true;
    final url = Uri.https(
        _baseUrl, '/api/transaction/search', {'searchQuery': 'david'});
    final resp = await http.get(url);

    final List<dynamic> walletMap = jsonDecode(resp.body);

    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData) {
      transactions.add(BuyProduct(
          item['amount'],
          item['purpose'],
          item['reference'],
          item['balanceBefore'],
          item['balanceAfter'],
          item['summary'],
          item['trnxSummary'],
          item['createdAt'],
          item['updatedAt'],
          item['_id']));
    }

    isLoading = false;
    notifyListeners();
    return transactions;
  }

  Future<http.Response> saveBuyProduct(
    String text,
    String text2,
    String text3,
  ) {
    return http.post(
      Uri.parse('https://smiley-appi.herokuapp.com/api/transaction/buyProduct'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fromUsername': text,
        'amount': text2,
        'summary': text3,
      }),
    );
  }
}
