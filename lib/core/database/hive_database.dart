abstract interface class HiveDatabase{
  String? getString(String key);

  bool? getBool(String key);

  int? getInt(String key);

  double? getDouble(String key);

  Future<void> setString(String key, String value);

  Future<void> setBool(String key, bool value);

  Future<void> setInt(String key, int value);

  Future<void> setDouble(String key, double value);

  Future<void> remove(String key);

  Future<int> clearAllPreferences();
}