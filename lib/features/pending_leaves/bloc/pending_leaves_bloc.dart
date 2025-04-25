import 'package:bloc/bloc.dart';
import 'package:leave_management_system/core/utils/app_strings.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_info.dart';
import '../model/pending_leaves_model.dart';

part 'pending_leaves_event.dart';
part 'pending_leaves_state.dart';

class PendingLeavesBloc extends Bloc<PendingLeavesEvent, PendingLeavesState> {
  final NetworkInfo _networkInfo;

  PendingLeavesBloc(this._networkInfo) : super(PendingLeavesInitial()) {
    on<PendingLeavesEventStarted>((event, emit) async{
      emit(PendingLeavesLoading());
      try {
        if(await _networkInfo.isConnected()){
          final PendingLeavesModel model = PendingLeavesModel(message: "No Data Found");
          emit(PendingLeavesSuccess(model:model));
        }else {
          emit(PendingLeavesError(msg: AppStrings.noInternet));
        }


      } catch (e) {
        emit(PendingLeavesError(msg: e.toString()));
      }
    });
  }
}
