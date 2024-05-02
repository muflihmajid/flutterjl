import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skeleton_mobileapps/data/persistences/repositories/hargaudang_repository.dart';
import 'package:skeleton_mobileapps/domains/entities/hargaudang.dart';

// Declaring usecase of the entity
class GetHargaUdangUsecase extends UseCase<List<HargaUdang>, Map<String, String>> {
  final HargaUdangRepository _repository;

  GetHargaUdangUsecase(this._repository);

  @override
  Future<Stream<List<HargaUdang>>> buildUseCaseStream(
      Map<String, String>? params) async {
    StreamController<List<HargaUdang>> controller = StreamController();
    try {
      List<HargaUdang> hargaudang = await _repository.getAll(params ?? {});
      controller.add(hargaudang);
      controller.close();
    } catch (e) {
      // print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}
