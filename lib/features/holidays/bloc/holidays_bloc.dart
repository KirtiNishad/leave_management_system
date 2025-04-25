import 'package:bloc/bloc.dart';
import 'package:leave_management_system/core/utils/app_strings.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_info.dart';
import '../model/holidays_model.dart';

part 'holidays_event.dart';
part 'holidays_state.dart';

class HolidaysBloc extends Bloc<HolidaysEvent, HolidaysState> {
  final NetworkInfo _networkInfo;

  HolidaysBloc(this._networkInfo) : super(HolidaysInitial()) {
    on<HolidaysEventStarted>((event, emit) async{
      emit(HolidaysLoading());
      try {
        if(await _networkInfo.isConnected()){
          final HolidaysModel model = HolidaysModel(message: "No Data Found");
          emit(HolidaysSuccess(model:model));
        }else {
          emit(HolidaysError(msg: AppStrings.noInternet));
        }


      } catch (e) {
        emit(HolidaysError(msg: e.toString()));
      }
    });
  }
}
