import 'package:bloc/bloc.dart';
import 'package:leave_management_system/core/database/hive_database.dart';
import 'package:leave_management_system/core/database/hive_database_key.dart';
import 'package:leave_management_system/core/routes/app_route_names.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final HiveDatabase database;
  SplashBloc(this.database) : super(SplashInitial()) {
    on<SplashEventStart>((event, emit)async {
      emit(SplashLoading());
      try{
        await Future.delayed(Duration(seconds: 4), (){
          bool isLogIn = database.getBool(HiveDatabaseKey.isLoggedIn) ?? false;
          if(isLogIn){
            emit(SplashSuccess(route: AppRouteNames.userDashboard));
          }else{
            emit(SplashSuccess(route: AppRouteNames.loginPage));

          }
        });


      }catch(e){
        emit(SplashError(msg: e.toString()));
      }
    });
  }
}
