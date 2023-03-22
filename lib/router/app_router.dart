import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/screens/feb14_screen/widget/Counter_Screen.dart';
import 'package:project1/screens/feb9_screen/counter_cubit.dart';

import '../screens/feb14_screen/widget/Counter2_Screen.dart';
import '../screens/feb14_screen/widget/Counter3_Screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>
            BlocProvider.value(
              value: _counterCubit,
              child: CounterScreen(),
            ));
        break;
      case '/secondCounter':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(
                  value: _counterCubit,
                  child: Counter2Screen(color: Colors.red),
                ));
        break;
      case '/thirdCounter':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(
                  value: _counterCubit,
                  child: Counter3Screen(color: Colors.cyan),
                ));
        break;
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
