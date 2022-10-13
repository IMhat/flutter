import 'dart:convert';
// import 'package:app_uteam/models/models.dart';

// import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/transaction.dart';

class ProductTransactionService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';

  List<Transaction> transactions = [];

  late Transaction selectedTransaction;

  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  ProductTransactionService() {
    // _dbProvider = DBProvider();
    loadTransaction();
  }

  // la url para que llame solo a las transacciones de un usuario es:   api/transaction/search?searchQuery=david

  //pero da un error de JSON INVALIDO asi que por ahora lo deje que llame a todas las transacciones

  Future<List<Transaction>> loadTransaction() async {
    isLoading = true;
    final url = Uri.https(
        _baseUrl, '/api/transaction/exchange/search', {'searchQuery': 'david'});
    final resp = await http.get(url);

    final List<dynamic> walletMap = jsonDecode(resp.body);

    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData) {
      transactions.add(Transaction(
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
}