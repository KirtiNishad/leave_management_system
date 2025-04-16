import 'package:hive/hive.dart';
import 'package:leave_management_system/core/database/hive_database.dart';

class HiveDatabaseImpl implements HiveDatabase{
  final Box box;

  HiveDatabaseImpl({required this.box});

  @override
  bool? getBool(String key) {
    return box.get(key, defaultValue: null);
  }

  @override
  double? getDouble(String key) {
    return box.get(key, defaultValue: null);
  }

  @override
  int? getInt(String key) {
    return box.get(key, defaultValue: null);
  }

  @override
  String? getString(String key) {
    return box.get(key, defaultValue: null);
  }

  @override
  Future<void> setBool(String key, bool value) {
    return box.put(key, value);
  }

  @override
  Future<void> setDouble(String key, double value) {
    return box.put(key, value);
  }

  @override
  Future<void> setInt(String key, int value) {
    return box.put(key, value);
  }

  @override
  Future<void> setString(String key, String value) {
    return box.put(key, value);
  }

  @override
  Future<int> clearAllPreferences() {
    return box.clear();
  }

  @override
  Future<void> remove(String key) {
    return box.delete(key);
  }
}