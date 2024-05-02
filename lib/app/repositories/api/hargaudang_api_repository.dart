
import 'dart:developer';

import 'package:skeleton_mobileapps/app/infrastructure/endpoints.dart';
import 'package:skeleton_mobileapps/data/infrastructures/api_service_interface.dart';
import 'package:skeleton_mobileapps/data/persistences/mappers/hargaudang_mapper.dart';
import 'package:skeleton_mobileapps/data/persistences/repositories/hargaudang_repository.dart';
import 'package:skeleton_mobileapps/domains/entities/hargaudang.dart';

class HargaUdangApiRepository extends HargaUdangRepository {
  late ApiServiceInterface _service;
  late Endpoints _endpoints;
  late HargaUdangMapper _mapper;

  HargaUdangApiRepository(
      ApiServiceInterface service, Endpoints endpoints, HargaUdangMapper mapper) {
    _service = service;
    _endpoints = endpoints;
    _mapper = mapper;
  }

  @override
  Future<List<HargaUdang>> getAll(Map<String, String> params) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(_endpoints.hargaudang(), RequestType.get,
          params: params);
    } catch (error) {
      log('Error nih bos $error');
      rethrow;
    }
    return _mapper.gethargaudangApiConverter(resp);
  }
}
