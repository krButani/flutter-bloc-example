import 'dart:async';


import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connStream;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetEvent>((event, emit) {
      on<InternetLostEvent>((event,emit)=> emit(InternetLostState()));
      on<InternetGainedEvent>((event,emit)=> emit(InternetGainedState()));
      connStream = _connectivity.onConnectivityChanged.listen((res) {
        if(res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
          add(InternetGainedEvent()); // Event Called
        } else {
          add(InternetLostEvent()); // Event Called
        }
      });
    });
  }

  @override
  Future<void> close() {
    connStream?.cancel();
    return super.close();
  }

}
