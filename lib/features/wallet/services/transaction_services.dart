import 'dart:convert';
// import 'package:app_uteam/models/models.dart';

// import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/transaction.dart';

class TransactionService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';

  List<Transaction> transactions = [];

  late Transaction selectedTransaction;

  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  TransactionService() {
    // _dbProvider = DBProvider();
    loadTransaction();
  }

  // la url para que llame solo a las transacciones de un usuario es:   api/transaction/search?searchQuery=david

  //pero da un error de JSON INVALIDO asi que por ahora lo deje que llame a todas las transacciones

  Future<List<Transaction>> loadTransaction() async {
    isLoading = true;
    final url = Uri.https(
        _baseUrl, '/api/transaction/task/search', {'searchQuery': 'david'});
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

  Future<http.Response> saveTasks(
      dynamic text, String text2, String text3, String text4) {
    return http.post(
      Uri.parse('https://smiley-appi.herokuapp.com/api/transaction'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'amount': text,
        'fromUsername': text2,
        'toUsername': text3,
        'summary': text4,
      }),
    );
  }
}
