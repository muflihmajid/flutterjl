
import 'package:injector/injector.dart';
import 'package:skeleton_mobileapps/app/ui/pages/hargaudang/presenter.dart';
import 'package:skeleton_mobileapps/use_cases/hargaudang/hargaudang.dart';

// Commonly here to declare dependency injection
class PresenterModule {
  static void init(Injector injector) {
    injector.registerDependency<HargaUdangPresenter>(() {
      return HargaUdangPresenter(injector.get<GetHargaUdangUsecase>());
    });
  }
}
