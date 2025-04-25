import 'package:bloc/bloc.dart';
import 'package:leave_management_system/core/utils/app_strings.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_info.dart';
import '../model/leave_request_model.dart';

part 'leave_request_event.dart';
part 'leave_request_state.dart';

class LeaveRequestBloc extends Bloc<LeaveRequestEvent, LeaveRequestState> {
  final NetworkInfo _networkInfo;

  LeaveRequestBloc(this._networkInfo) : super(LeaveRequestInitial()) {
    on<LeaveRequestStarted>((event, emit) async{
      emit(LeaveRequestLoading());
      try {
        if(await _networkInfo.isConnected()){
          final LeaveRequestModel model = LeaveRequestModel(message: "No Data Found");
          emit(LeaveRequestSuccess(model:model));
        }else {
          emit(LeaveRequestError(msg: AppStrings.noInternet));
        }


      } catch (e) {
        emit(LeaveRequestError(msg: e.toString()));
      }
    });
  }
}
