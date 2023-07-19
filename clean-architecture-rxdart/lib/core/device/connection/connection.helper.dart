import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionHelper {
  late ConnectivityResult _connectivityResult;

  Future _connect() async {
    _connectivityResult = await Connectivity().checkConnectivity();
  }

  Future<bool> hasConnection() async {
    await _connect();
    if (_connectivityResult == ConnectivityResult.mobile) return true;
    if (_connectivityResult == ConnectivityResult.wifi) return true;
    return false;
  }

  static Stream<ConnectivityResult> connectionListener() {
    return Connectivity().onConnectivityChanged;
  }
}
