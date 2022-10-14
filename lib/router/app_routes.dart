import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

import '../features/home/screens/home.dart';
import '../features/tasks/screens/acept_task.dart';
import '../features/tasks/screens/challenge_acept.dart';
import '../features/tasks/screens/manage_task_screens.dart';
import '../features/tasks/screens/progres_task_view.dart';
import '../features/tasks/screens/progress_taskInprogress_view.dart';
import '../models/menu_options.dart';

//import '../screens/image_screens.dart';

class AppRoutes {
  static const initialRoute = 'Initial';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'ManageTasks',
        icon: Icons.manage_search_outlined,
        name: 'Gestor de Tareas',
        screen: ManageTaskScreen()),
    MenuOption(
        route: 'AceptTasks',
        icon: Icons.manage_search_outlined,
        name: 'Tarea aceptada',
        screen: AceptTaskScreen()),
    MenuOption(
        route: 'ChallengeAcepted',
        icon: Icons.manage_search_outlined,
        name: 'Challenge acepted',
        screen: ChallengeAcepted()),
    MenuOption(
        route: 'ProgresTaskView',
        icon: Icons.manage_search_outlined,
        name: 'Progreso Tarea',
        screen: ProgresTaskView()),
    MenuOption(
        route: 'ProgresTaskInprogressView',
        icon: Icons.manage_search_outlined,
        name: 'Progreso Tarea',
        screen: ProgresTaskInprogressView()),
    // MenuOption(
    //     route: 'Notification',
    //     icon: Icons.manage_search_outlined,
    //     name: 'Notification',
    //     screen: NotificationScreen()),

    // MenuOption(
    //     route: 'ManageProducts',
    //     icon: Icons.manage_search_outlined,
    //     name: 'Gestor de Productos',
    //     screen: ManageProductScreen()),
    // MenuOption(
    //     route: 'ManagePoints',
    //     icon: Icons.admin_panel_settings,
    //     name: 'ADMIN Panel de Puntos',
    //     screen: ManagePointScreen()),
    // MenuOption(
    //     route: 'team',
    //     icon: Icons.money_sharp,
    //     name: 'Uteam Points',
    //     screen: TabScreen()),
    // MenuOption(
    //     route: 'UserScreen',
    //     icon: Icons.supervised_user_circle_sharp,
    //     name: 'Usuarios UTEAM',
    //     screen: UserScreen()),
    MenuOption(
        route: 'homePage',
        icon: Icons.home,
        name: 'PantallaHome',
        screen: const HomePage()),
    MenuOption(
        route: 'AuthPage',
        icon: Icons.home,
        name: 'PantallaAuth',
        screen: const AuthScreen()),
    // MenuOption(
    //     route: 'ListImage',
    //     icon: Icons.image,
    //     name: 'Imagenes',
    //     screen: ListImage()),
    // MenuOption(
    //     route: 'imageScreen',
    //     icon: Icons.image,
    //     name: 'Pantalla de Imagenes',
    //     screen: ImageScreen()),
    // MenuOption(
    //     route: 'register',
    //     icon: Icons.app_registration,
    //     name: 'Register Screen',
    //     screen: const RegisterScreen()),
    // MenuOption(
    //     route: 'AcercaDe',
    //     icon: Icons.home,
    //     name: 'product_card',
    //     screen: const AcercaDe()),
    // MenuOption(
    //     route: 'AcercaDe',
    //     icon: Icons.home,
    //     name: 'product_card',
    //     screen: AcercaDe()),
    // MenuOption(
    //     route: 'AcercaDeIndumentaria',
    //     icon: Icons.home,
    //     name: 'product_card',
    //     screen: AcercaDeIndumentaria()),
    // MenuOption(
    //     route: 'AcercaDeCursos',
    //     icon: Icons.home,
    //     name: 'product_card',
    //     screen: AcercaDeCursos()),
    // MenuOption(
    //     route: 'login',
    //     icon: Icons.login_outlined,
    //     name: 'Pantalla de login',
    //     screen: const LoginScreen()),
    // MenuOption(
    //     route: 'Initial',
    //     icon: Icons.login_outlined,
    //     name: 'Pantalla de Inicio',
    //     screen: const InitialScreen()),
    // MenuOption(
    //     route: 'tasksPost',
    //     icon: Icons.list_alt_outlined,
    //     name: 'Agregar Tareas',
    //     screen: const TaskPostScreen()),
    // MenuOption(
    //     route: 'productsPost',
    //     icon: Icons.list_alt_outlined,
    //     name: 'Agregar Productos',
    //     screen: const ProductPostScreen()),
    // MenuOption(
    //     route: 'pointsPost',
    //     icon: Icons.list_alt_outlined,
    //     name: 'Agregar Puntos',
    //     screen: const PointPostScreen()),
    // // MenuOption(
    // //     route: 'usersPost',
    // //     icon: Icons.list_alt_outlined,
    // //     name: 'Agregar Usuarios',
    // //     screen: const UserPostScreen()),
    // MenuOption(
    //     route: 'taskPut',
    //     icon: Icons.edit,
    //     name: 'Editar Tareas',
    //     screen: const TaskPutScreen()),
    // MenuOption(
    //     route: 'productsPut',
    //     icon: Icons.edit,
    //     name: 'Editar Productos',
    //     screen: const ProductPutScreen()),

    // MenuOption(
    //     route: 'pointPut',
    //     icon: Icons.edit,
    //     name: 'Editar Puntaje',
    //     screen: const PointPutScreen()),

    // MenuOption(
    //     route: 'userPut',
    //     icon: Icons.edit,
    //     name: 'Editar Usuarios',
    //     screen: const UserPutScreen()),

    // MenuOption(
    //     route: 'home2',
    //     icon: Icons.app_registration,
    //     name: 'Cambiar pantalla',
    //     screen: const TabsPage()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
