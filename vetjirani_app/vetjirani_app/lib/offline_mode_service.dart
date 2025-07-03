import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class OfflineModeService {
  final Connectivity _connectivity = Connectivity();
  final List<Function> _queuedActions = [];

  final StreamController<bool> _connectivityController = StreamController<bool>.broadcast();

  OfflineModeService() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      bool isOnline = result != ConnectivityResult.none;
      _connectivityController.add(isOnline);
      if (isOnline) {
        _processQueue();
      }
    });
  }

  Stream<bool> get connectivityStream => _connectivityController.stream;

  void queueAction(Function action) {
    _queuedActions.add(action);
  }

  void _processQueue() {
    for (var action in _queuedActions) {
      action();
    }
    _queuedActions.clear();
  }

  Future<bool> checkConnectivity() async {
    var result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  void dispose() {
    _connectivityController.close();
  }
}
