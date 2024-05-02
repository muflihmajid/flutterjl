import 'package:skeleton_mobileapps/app/infrastructure/event/connection.dart';
import 'package:skeleton_mobileapps/app/infrastructure/event/error.dart';
import 'package:skeleton_mobileapps/app/infrastructure/event/reset_ui.dart';
import 'package:skeleton_mobileapps/app/misc/RouteArguments.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../app_component.dart';

class BaseController extends Controller {
  EventBus _eventBus = AppComponent.getInjector().get<EventBus>();
  bool _internetAvailable = true;
  RouteArguments? args;
  bool isLoading = false;

  bool get internetAvailable => _internetAvailable;

  BaseController() : super() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void initListeners() {

    _eventBus.on<ResetUIEvent>().listen((event) {
      dismissLoading();
      refreshUI();
    });

    // Check if data/wifi is active every OS setting change
    _eventBus.on<ConnectionEvent>().listen((event) {
      if (event.isConnected) {
        internetAvailabilityCycle(true);
        refreshUI();
      } else {
        internetAvailabilityCycle(false);
        dismissLoading();
        refreshUI();
      }
    });
  }

  void internetAvailabilityCycle(bool status) {
    if (status) {
      _internetAvailable = status;
      onInternetDisconnected();
    } else {
      _internetAvailable = status;
      onInternetConnected();
    }
  }

  void onError({String title = "Error", String message = "Please try again!"}) {
    _eventBus.fire(ErrorEvent(message));
  }

  void onInternetConnected() {
    // do something
  }

  void onInternetDisconnected() {
    // do something
  }

  void onProgressLoading() {}

  void onFinishLoading() {}

  void delayedRefresh({int duration = 1}) {
    Future.delayed(new Duration(seconds: duration), refreshUI);
  }

  void resetPage() {
    dismissLoading();
    refreshUI();
  }

  void dismissLoading() {
    isLoading = false;
    refreshUI();
  }

  void onLoad() {
    loadOnStart();
    refreshUI();
  }

  void showLoading() {
    isLoading = true;
    refreshUI();
  }

  void loadOnStart() {
    isLoading = true;
  }
}
