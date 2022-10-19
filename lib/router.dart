import 'package:smiley_app/common/widgets/bottom_bar.dart';
import 'package:smiley_app/features/address/screens/address_screen.dart';
import 'package:smiley_app/features/admin/screens/add_product_screen.dart';
import 'package:smiley_app/features/auth/screens/auth_screen.dart';
import 'package:smiley_app/features/home/screens/category_deals_screen.dart';
import 'package:smiley_app/features/order_details/screens/order_details_screen.dart';
import 'package:smiley_app/features/product_details/screens/product_details_screen.dart';
import 'package:smiley_app/features/search/screens/search_screen.dart';
import 'package:smiley_app/models/order.dart';
import 'package:smiley_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:smiley_app/models/task_inprogress.dart';
import 'package:smiley_app/models/tasks.dart';

import 'features/home/screens/catalogo_screen.dart';
import 'features/tasks/screens/task_detail_screen.dart';
import 'features/tasks/screens/task_inprogress_detail_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(
          product: product,
        ),
      );
    case TaskDetailsScreen.routeName:
      var task = routeSettings.arguments as Task;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskDetailsScreen(task: task),
      );
    case TaskInprogressDetailsScreen.routeName:
      var task = routeSettings.arguments as TaskInprogress;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskInprogressDetailsScreen(task: task),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(totalAmount: totalAmount),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
