import 'package:connectivity_plus/connectivity_plus.dart';

class HasConnection {
  HasConnection();

  Future<bool> call() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    }
    return false;
  }
}
