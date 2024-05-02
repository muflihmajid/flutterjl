import 'package:skeleton_mobileapps/app/infrastructure/contract/base_controller.dart';

class MainController extends BaseController {
  int? _tabIndex;

  int? get tabIndex => _tabIndex;

  MainController() : super() {
    _tabIndex = 0;
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInternetConnected() {
    super.onInternetConnected();
  }

  @override
  void onInternetDisconnected() {
    super.onInternetDisconnected();
  }

  void changeTab(i) {
    this._tabIndex = i;
    refreshUI();
  }
}
