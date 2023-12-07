import 'package:flutter/material.dart';
import 'package:incident_reporting/src/services/connectivity_service_provider.dart/data_connection_checker.dart';

enum ConnectionStatus { connected, disconnected }

class InternetConnectionProvider extends ChangeNotifier {
  late DataConnectionChecker _dataConnectionChecker;
  late bool _isConnected;

  InternetConnectionProvider() {
    _dataConnectionChecker = DataConnectionChecker();
    _isConnected = true; // Assume connected initially

    // Listen for changes in internet connection status
    _dataConnectionChecker.onStatusChange.listen((status) {
      _isConnected = status == DataConnectionStatus.connected;
      notifyListeners();
    });
  }

  bool get isConnected => _isConnected;
}
