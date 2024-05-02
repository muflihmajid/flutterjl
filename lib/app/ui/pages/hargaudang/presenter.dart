import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skeleton_mobileapps/domains/entities/hargaudang.dart';
import 'package:skeleton_mobileapps/use_cases/hargaudang/hargaudang.dart';


class HargaUdangPresenter extends Presenter {
  late GetHargaUdangUsecase _hargaudangUseCase;

  // get categories
  late Function getHargaUdangOnNext;
  late Function getHargaUdangOnComplete;
  late Function getHargaUdangOnError;

  HargaUdangPresenter(GetHargaUdangUsecase hargaudangUseCase) {
    _hargaudangUseCase = hargaudangUseCase;
  }

  void getHargaUdangList({Map<String, String> params = const {}}) {
    _hargaudangUseCase.execute(_GetHargaUdangObserver(this), params);
  }

  void dispose() {
    _hargaudangUseCase.dispose();
  }
}

class _GetHargaUdangObserver implements Observer<List<HargaUdang>> {
  HargaUdangPresenter _presenter;

  _GetHargaUdangObserver(this._presenter);

  void onNext(List<HargaUdang>? hargaudang) {
    _presenter.getHargaUdangOnNext(hargaudang);
  }

  void onComplete() {
    _presenter.getHargaUdangOnComplete();
  }

  void onError(e) {
    _presenter.getHargaUdangOnError(e);
  }
}
