import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/models/room_description/room_model.dart';
import '../../../data/repositories/repository2.dart';

part 'nomer_event.dart';
part 'nomer_state.dart';

class NomerBloc extends Bloc<NomerEvent, NomerState> {
  NomerBloc(this.repostory1) : super(NomerInitial()) {
    on<NomerLoad>(_onNomerScreenLoad);
  }

  final Repository2 repostory1;
  void _onNomerScreenLoad(NomerLoad event, Emitter<NomerState> emit) async {
    try {
      emit(NomerScreenLoading());
      final result1 = await repostory1.getData1();

      emit(NomerScreenLoadInf(data1: result1));
    } catch (e) {
      print(e);
    }
  }
}
