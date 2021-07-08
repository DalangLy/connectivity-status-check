import 'package:check_connectivity/bloc/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocListener<NetworkBloc, NetworkState>(
            listener: (context, state) {
              if(state is OnlineWithNotify){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Is Online')));
              }
              if(state is OfflineWithNotify){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Is Offline')));
              }
            },
            child: BlocBuilder<NetworkBloc, NetworkState>(
              builder: (context, state) {
                if(state is OnlineWithNotify || state is Online){
                  return Text('Online');
                }
                return Text('Offline');
              },
            ),
          ),
        ),
      ),
    );
  }
}
