import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:leave_management_system/core/database/hive_database.dart';
import 'package:leave_management_system/core/database/hive_database_impl.dart';
import 'package:leave_management_system/core/network/network_info.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final box = await Hive.openBox("preference");

  final connectivity = Connectivity();

  final networkInfo = NetworkInfoImpl(connectivity);
  getIt.registerLazySingleton<NetworkInfo>(() => networkInfo);

  final appPreferences = HiveDatabaseImpl(box: box);
  getIt.registerLazySingleton<HiveDatabase>(() => appPreferences);
}
