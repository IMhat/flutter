import 'dart:convert';

import 'package:smiley_app/constants/error_handling.dart';
import 'package:smiley_app/constants/global_variables.dart';
import 'package:smiley_app/constants/utils.dart';
import 'package:smiley_app/features/auth/screens/auth_screen.dart';
import 'package:smiley_app/models/buyProduct.dart';
import 'package:smiley_app/models/order.dart';
import 'package:smiley_app/models/task_done.dart';
import 'package:smiley_app/models/task_inprogress.dart';
import 'package:smiley_app/models/tasks.dart';
import 'package:smiley_app/models/transaction.dart';
import 'package:smiley_app/models/transaction_Negative.dart';
import 'package:smiley_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../models/wallet.dart';

class AccountServices {
  //EXCHANGE
  void exchange({
    required BuildContext context,
    required String fromUsername,
    required double amount,
    required String summary,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      buyProduct transaction = buyProduct(
        fromUsername: fromUsername,
        amount: amount,
        summary: summary,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/transaction/buyProduct'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: transaction.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Exchange Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  //WALLETT!!

  Future<List<Wallet>> fetchMyWallet({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Wallet> walletList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/wallets/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            walletList.add(
              Wallet.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return walletList;
  }

  //positive transaction

  Future<List<Transaction>> fetchMyWalletTransaction({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Transaction> transactionList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/transaction/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            transactionList.add(
              Transaction.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return transactionList;
  }

  //negative transaction

  Future<List<negativeTransaction>> fetchMyWalletNegativeTransaction({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<negativeTransaction> negativeTransactionList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/transaction/exchange/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            negativeTransactionList.add(
              negativeTransaction.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return negativeTransactionList;
  }

//TASKS!!

  Future<List<Task>> fetchMyBacklogTask({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Task> taskList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/tasks/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            taskList.add(
              Task.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return taskList;
  }

  Future<List<TaskInprogress>> fetchMyInprogressTask({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<TaskInprogress> taskInprogressList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/tasks/inprogress/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            taskInprogressList.add(
              TaskInprogress.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return taskInprogressList;
  }

  Future<List<TaskDone>> fetchMyDoneTask({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<TaskDone> taskDoneList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/tasks/done/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            taskDoneList.add(
              TaskDone.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return taskDoneList;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
