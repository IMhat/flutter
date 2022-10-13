import 'dart:convert';
// import 'package:app_uteam/models/models.dart';

// import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/wallet.dart';

class WalletService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';

  List<Wallet> wallet = [];

  late Wallet selectedWallet;

  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  WalletService() {
    // _dbProvider = DBProvider();
    loadWallet();
  }

  // la url para que llame solo a la wallet de un usuario es:   api/wallet/search?searchQuery=david

  //pero da un error de JSON INVALIDO asi que por ahora lo deje que llame a todas las wallets

  Future<List<Wallet>> loadWallet() async {
    isLoading = true;
    final url =
        Uri.https(_baseUrl, "/api/wallet/search", {'searchQuery': 'david'});
    final resp = await http.get(url);

    final List<dynamic> walletMap = jsonDecode(resp.body);

    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData) {
      wallet.add(Wallet(item["balance"], item["username"], item["updateAt"],
          item["createdAt"], item["_id"]));
    }

    isLoading = false;
    notifyListeners();
    return wallet;
  }

  Future<http.Response> saveTasks(String text) {
    return http.post(
      Uri.parse('https://smiley-appi.herokuapp.com/api/wallet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': text,
      }),
    );
  }
}
