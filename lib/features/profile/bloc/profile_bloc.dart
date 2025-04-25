import 'package:bloc/bloc.dart';
import 'package:leave_management_system/core/utils/app_strings.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_info.dart';
import '../model/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final NetworkInfo _networkInfo;

  ProfileBloc(this._networkInfo) : super(ProfileInitial()) {
    on<ProfileEventStarted>((event, emit) async {
      emit(ProfileLoading());
      try {
        if (await _networkInfo.isConnected()) {
          final ProfileModel model = ProfileModel(message: "No Data Found");
          emit(ProfileSuccess(model: model));
        } else {
          emit(ProfileError(msg: AppStrings.noInternet));
        }
      } catch (e) {
        emit(ProfileError(msg: e.toString()));
      }
    });
  }
}
