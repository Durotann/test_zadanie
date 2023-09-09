import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/model_bron/model_bron.dart';
import '../../../data/repositories/repository3.dart';

part 'bron_event.dart';
part 'bron_state.dart';

class BronBloc extends Bloc<BronEvent, BronState> {
  BronBloc(this.repository3) : super(BronInitial()) {
    on<BronLoad>(_onBronScreenLoad);
  }
  final Repository3 repository3;

  void _onBronScreenLoad(BronLoad event, Emitter<BronState> emit) async {
    try {
      emit(BronLoading());
      final result = await repository3.getData2();
      emit(BronLoadInf(data: result));
    } catch (e) {}
  }
}
