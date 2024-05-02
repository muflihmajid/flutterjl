import 'package:skeleton_mobileapps/app/infrastructure/endpoints.dart';
import 'package:skeleton_mobileapps/app/infrastructure/persistences/api_service.dart';
import 'package:skeleton_mobileapps/app/repositories/api/hargaudang_api_repository.dart';
import 'package:injector/injector.dart';
import 'package:skeleton_mobileapps/data/persistences/mappers/hargaudang_mapper.dart';

class RepositoryModule {
  static void init(Injector injector) {
    injector.registerDependency<HargaUdangApiRepository>(() {
      return HargaUdangApiRepository(injector.get<ApiService>(),
          injector.get<Endpoints>(), injector.get<HargaUdangMapper>());
    });
  }
}
