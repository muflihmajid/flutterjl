import 'package:skeleton_mobileapps/data/persistences/mappers/hargaudang_mapper.dart';
import 'package:injector/injector.dart';

class MapperModule {
  static void init(Injector injector) {
    injector.registerSingleton<HargaUdangMapper>(() => HargaUdangMapper());
  }
}
