import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();

  Stream<List<ConnectivityResult>> connectivitySubscription();
}
class NetworkInfoImpl extends NetworkInfo{
  final Connectivity connectivity;
  NetworkInfoImpl(this.connectivity);

  @override
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

  @override
  Stream<List<ConnectivityResult>> connectivitySubscription() {
    return connectivity.onConnectivityChanged;
  }

}