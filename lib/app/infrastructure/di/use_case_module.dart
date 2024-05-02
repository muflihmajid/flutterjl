import 'package:injector/injector.dart';
import 'package:skeleton_mobileapps/app/repositories/api/hargaudang_api_repository.dart';
import 'package:skeleton_mobileapps/use_cases/hargaudang/hargaudang.dart';

// Commonly here to declare dependency injection
class UseCaseModule {
  static void init(Injector injector) {
    // Use case
    injector.registerDependency<GetHargaUdangUsecase>(() {
      return GetHargaUdangUsecase(injector.get<HargaUdangApiRepository>());
    });
  }
}
