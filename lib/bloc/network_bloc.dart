import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final Connectivity connectivity;
  NetworkBloc({required this.connectivity}) : super(NetworkInitial());

  @override
  Stream<NetworkState> mapEventToState(
    NetworkEvent event,
  ) async* {
    if(event is StartCheckingConnectivity){
      _initConnectivity();
    }
    else if(event is ConnectivityChangedToOnline){
      yield NetworkingUpdating();
      yield OnlineWithNotify();
    }
    else if(event is ConnectivityChangedToOffline){
      yield NetworkingUpdating();
      yield OfflineWithNotify();
    }
    else if(event is OnStartUpOffline){
      yield NetworkingUpdating();
      yield OfflineWithNotify();
    }
    else if(event is OnStartUpOnline){
      yield NetworkingUpdating();
      yield Online();
    }
  }

  Future<void> _initConnectivity() async {
    bool onStartUpOnline = false;
    ConnectivityResult connectivityResult = await connectivity.checkConnectivity();
    if(connectivityResult != ConnectivityResult.none){
      onStartUpOnline = true;
      add(OnStartUpOnline());
    }
    else{
      add(OnStartUpOffline());
    }

    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if(onStartUpOnline){
        onStartUpOnline = false;
        return;
      }
      if(result != ConnectivityResult.none){
        add(ConnectivityChangedToOnline());
      }
      else{
        add(ConnectivityChangedToOffline());
      }
    });
  }
}
