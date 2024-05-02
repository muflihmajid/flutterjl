import 'package:skeleton_mobileapps/app/ui/pages/hargaudang/presenter.dart';
import 'package:skeleton_mobileapps/app/ui/pages/kabarudang/controller.dart';
import 'package:skeleton_mobileapps/app/ui/pages/hargaudang/controller.dart';
import 'package:skeleton_mobileapps/app/ui/pages/main/controller.dart';
import 'package:skeleton_mobileapps/app/ui/pages/penyakit/controller.dart';
import 'package:skeleton_mobileapps/app/ui/pages/splash/controller.dart';
import 'package:injector/injector.dart';

class ControllerModule {
  static void init(Injector injector) {
    injector.registerDependency<SplashController>(() {
      return SplashController();
    });
    injector.registerDependency<MainController>(() {
      return MainController();
    });
    injector.registerDependency<HargaUdangController>(() {
      return HargaUdangController(injector.get<HargaUdangPresenter>());
    });
    injector.registerDependency<MidController>(() {
      return MidController();
    });
    injector.registerDependency<ProfileController>(() {
      return ProfileController();
    });
  }
}
