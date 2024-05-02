import 'dart:developer';
import 'dart:ffi';

import 'package:intl/intl.dart';
import 'package:skeleton_mobileapps/app/infrastructure/contract/base_controller.dart';
import 'package:skeleton_mobileapps/app/ui/pages/hargaudang/presenter.dart';
import 'package:skeleton_mobileapps/domains/entities/hargaudang.dart';

class HargaUdangController extends BaseController {
  late final HargaUdangPresenter _presenter;
  late List<HargaUdang> _hargaudangs;
  List<String> get imageList => _imageList;
  List<HargaUdang> get hargaudangs => _hargaudangs;

  HargaUdangController(this._presenter) : super() {
    _hargaudangs = [];
    loadOnStart();
    initListeners();
    load();
  }
  final List<String> _imageList = [
    'lib/app/ui/assets/images/AskbyJALA.png',
    'lib/app/ui/assets/images/QuizbyJALA.png',
  ];

  void load() {
    _presenter.getHargaUdangList();
    log('data dari controller: $_hargaudangs');
  }

  @override
  void initListeners() {
    super.initListeners();

    _presenter.getHargaUdangOnNext = (List<HargaUdang> HargaUdangs) {
      _hargaudangs = HargaUdangs;
      refreshUI();
    };

    _presenter.getHargaUdangOnComplete = () {
      dismissLoading();
    };

    _presenter.getHargaUdangOnError = (e) {
      log("message:$e");
      dismissLoading();
    };
  }

  String formatDate(String inputDate) {
    DateTime date = DateTime.parse(inputDate);
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
