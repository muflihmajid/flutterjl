

import 'package:skeleton_mobileapps/domains/entities/hargaudang.dart';

abstract class HargaUdangRepository {
  Future<List<HargaUdang>> getAll(Map<String, String> params);
}
