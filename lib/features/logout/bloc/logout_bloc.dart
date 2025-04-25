import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/hive_database.dart';
import '../../../core/database/hive_database_key.dart';
import '../../../core/network/network_info.dart';
import '../../../core/utils/app_strings.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final NetworkInfo _networkInfo;
  final HiveDatabase database;

  LogoutBloc(this._networkInfo, this.database) : super(LogoutInitial()) {
    on<LogoutEventStarted>((event, emit) async {
      emit(LogoutLoading());
      try {
        if (await _networkInfo.isConnected()) {
          database.setBool(HiveDatabaseKey.isLoggedIn, false);
          emit(LogoutSuccess());
        } else {
          emit(LogoutError(msg: AppStrings.noInternet));
        }
      } catch (e) {
        emit(LogoutError(msg: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
