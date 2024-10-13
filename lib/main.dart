import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/routes_manager/route_generator.dart';
import 'package:shoppe/core/routes_manager/routes.dart';
import 'package:shoppe/core/widgets/shared_preference_utils.dart';
import 'package:shoppe/domain/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');
  String route;
  if (token == null) {
    route = Routes.loginScreen;
  } else {
    route = Routes.homeScreen;
  }
  runApp(MyApp(
    route: route,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.route});

  String route;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoppe',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.loginScreen,
      ),
    );
  }
}

// added images & svg for  assets
// create file splash_screen.yaml

// package
// add flutter_native_splash
// add flutter_svg
// shimmer
// flutter_screenutil
// dart pub add dartz
// dart pub add dio
// flutter pub add connectivity_plus
// flutter pub add flutter_bloc

// dart pub add injectable
// dart pub add get_it
//dart pub add injectable_generator
//dart pub add dev:build_runner
//
// flutter pub add shared_preferences