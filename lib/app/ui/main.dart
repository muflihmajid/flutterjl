import 'package:skeleton_mobileapps/app/infrastructure/app_component.dart';
import 'package:skeleton_mobileapps/app/infrastructure/router.dart'
    as CustomRouter;
import 'package:skeleton_mobileapps/app/ui/common/size_utils.dart';
import 'package:skeleton_mobileapps/app/ui/common/themecustom.dart';
import 'package:skeleton_mobileapps/app/ui/pages/splash/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';

main() async {
  await dotenv.load(fileName: '.env'); // load env
  AppComponent.init(); // init dependency
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final CustomRouter.Router _router;
  static bool isConnectedToInternet = false;
  final _navigatorKey = GlobalKey<NavigatorState>();
  MyApp() : _router = CustomRouter.Router() {
    _initLogger(); // init logger
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          navigatorKey: _navigatorKey,
          locale: const Locale('id'),
          theme: theme,
          home: SplashPage(),
          onGenerateRoute: _router.getRoute,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [_router.routeObserver],
        );
      },
    );
  }
}

void _initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.info("Logger initialized.");
}
