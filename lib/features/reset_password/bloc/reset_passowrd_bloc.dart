import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_info.dart';
import '../../../core/utils/app_strings.dart';

part 'reset_passowrd_event.dart';
part 'reset_passowrd_state.dart';

class ResetPassowrdBloc extends Bloc<ResetPassowrdEvent, ResetPassowrdState> {
  final NetworkInfo _networkInfo;

  ResetPassowrdBloc(this._networkInfo) : super(ResetPassowrdInitial()) {
    on<ResetPasswordStarted>((event, emit) async {
      emit(ResetPassowrdLoading());
      try {
        if (await _networkInfo.isConnected()) {
          emit(ResetPassowrdSuccess(msg: "OTP sent Successfully"));
        } else {
          emit(ResetPassowrdError(msg: AppStrings.noInternet));
        }
      } catch (e) {
        emit(ResetPassowrdError(msg: e.toString()));
      }
    });
  }
}
