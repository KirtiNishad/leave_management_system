import 'package:bloc/bloc.dart';
import 'package:leave_management_system/core/utils/app_strings.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_info.dart';
import '../model/notification_model.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NetworkInfo _networkInfo;

  NotificationsBloc(this._networkInfo) : super(NotificationsInitial()) {
    on<NotificationsEventStarted>((event, emit) async{
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      emit(NotificationsLoading());
      try {
        if(await _networkInfo.isConnected()){
          final NotificationsModel model = NotificationsModel(message: "No Data Found");
          emit(NotificationsSuccess(model:model));
        }else {
          emit(NotificationsError(msg: AppStrings.noInternet));
        }


      } catch (e) {
        emit(NotificationsError(msg: e.toString()));
      }
    });
  }
}
