import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo{
  Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult.contains(ConnectivityResult.wifi)){
      return true;
    }else if(connectivityResult.contains(ConnectivityResult.mobile)){
      return true;
    }else if(connectivityResult.contains(ConnectivityResult.bluetooth)){
      return true;
    }else if(connectivityResult.contains(ConnectivityResult.vpn)){
      return true;
    }else if(connectivityResult.contains(ConnectivityResult.ethernet)){
      return true;
    }else if(connectivityResult.contains(ConnectivityResult.other)){
      return true;
    }else{
      return false;
    }
  }
}