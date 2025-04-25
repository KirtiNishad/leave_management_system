import 'package:bloc/bloc.dart';
import 'package:leave_management_system/core/database/hive_database.dart';
import 'package:leave_management_system/core/database/hive_database_key.dart';
import 'package:leave_management_system/core/utils/app_strings.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/network_info.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final NetworkInfo _networkInfo;
  final HiveDatabase database;

  LoginBloc(this._networkInfo, this.database) : super(LoginInitial()) {
    on<LoginEventStarted>((event, emit) async {
      emit(LoginLoading());
      try {
        if (await _networkInfo.isConnected()) {
          database.setBool(HiveDatabaseKey.isLoggedIn, true);
          emit(LoginSuccess(msg: "Login Successfull!"));
        } else {
          emit(LoginError(msg: AppStrings.noInternet));
        }
      } catch (e) {
        emit(LoginError(msg: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
