import 'package:amazon_clone/models/wallet.dart';
import 'package:flutter/material.dart';

class WalletFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Wallet wallet;

  WalletFormProvider(this.wallet);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
