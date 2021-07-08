part of 'network_bloc.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();
}

class NetworkInitial extends NetworkState {
  @override
  List<Object> get props => [];
}

class NetworkingUpdating extends NetworkState{
  @override
  List<Object?> get props => [];
}

class OnlineWithNotify extends NetworkState{
  @override
  List<Object?> get props => [];
}
class OfflineWithNotify extends NetworkState{
  @override
  List<Object?> get props => [];
}
class Online extends NetworkState{
  @override
  List<Object?> get props => [];
}