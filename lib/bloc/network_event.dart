part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();
}

class StartCheckingConnectivity extends NetworkEvent{
  @override
  List<Object?> get props => [];
}

class OnStartUpOffline extends NetworkEvent{
  @override
  List<Object?> get props => [];
}

class OnStartUpOnline extends NetworkEvent{
  @override
  List<Object?> get props => [];
}

class ConnectivityChangedToOnline extends NetworkEvent{
  @override
  List<Object?> get props => [];
}

class ConnectivityChangedToOffline extends NetworkEvent{
  @override
  List<Object?> get props => [];
}