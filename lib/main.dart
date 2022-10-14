import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/initial_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/home/services/wallet_services.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:amazon_clone/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/auth_screen.dart';
import 'features/tasks/services/task_done_service.dart';
import 'features/tasks/services/task_inprogress_service.dart';
import 'features/tasks/services/task_services.dart';
import 'features/wallet/services/productTransaction_service.dart';
import 'features/wallet/services/transaction_services.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(create: (_) => WalletService()),
    ChangeNotifierProvider(create: (_) => TaskService()),
    ChangeNotifierProvider(create: (_) => TaskInprogressService()),
    ChangeNotifierProvider(create: (_) => TaskDoneService()),
    ChangeNotifierProvider(create: (_) => TransactionService()),
    ChangeNotifierProvider(create: (_) => ProductTransactionService()),
  ], child: const MyApp()));
}

// snth
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smiley',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      routes: AppRoutes.getAppRoutes(),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const InitialScreen(),
    );
  }
}
