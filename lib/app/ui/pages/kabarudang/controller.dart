import 'package:skeleton_mobileapps/app/infrastructure/contract/base_controller.dart';

class MidController extends BaseController {

  MidController() : super() {
    // setupFlushbar();
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
    // kFlushbar..show(getContext());
  }

  @override
  void onInternetDisconnected() {
    super.onInternetDisconnected();
  }
}
