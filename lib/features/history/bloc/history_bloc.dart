import 'package:bloc/bloc.dart';
import 'package:leave_management_system/core/utils/app_strings.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_info.dart';
import '../model/history_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final NetworkInfo _networkInfo;

  HistoryBloc(this._networkInfo) : super(HistoryInitial()) {
    on<HistoryEventStarted>((event, emit) async{
      emit(HistoryLoading());
      try {
        if(await _networkInfo.isConnected()){
          final HistoryModel model = HistoryModel(message: "No Data Found");
          emit(HistorySuccess(model:model));
        }else {
          emit(HistoryError(msg: AppStrings.noInternet));
        }


      } catch (e) {
        emit(HistoryError(msg: e.toString()));
      }
    });
  }
}
