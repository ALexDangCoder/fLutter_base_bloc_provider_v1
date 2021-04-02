import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferenceKey {
  keyAccessToken,
}

extension SharedPreferenceKeyExt on SharedPreferenceKey {
  /// Get the values either from [_mapFromPreviousKeyValues] previous name
  /// or just call [toString] method which will return with format of
  /// SharedPreferenceKey.<enumKeys>. This is mainly to avoid issues for
  /// new [SharedPreferenceKey] enum but forgot to declare the string name
  /// (which will return [Null] and may cause the storage didn't work as
  /// expected.
  String get name => _mapFromPreviousKeyValues[this] ?? toString();

  /// The existing [SharedPreferenceKey] values before moved to enum.
  Map<SharedPreferenceKey, String> get _mapFromPreviousKeyValues => {
        SharedPreferenceKey.keyAccessToken: 'key_accessToken',
      };
}

class SharedPreferencesManager {
  static SharedPreferencesManager _instance;
  static SharedPreferences _sharedPreferences;

  static Future<SharedPreferencesManager> getInstance() async {
    _instance ??= SharedPreferencesManager();
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  Future<bool> putString(SharedPreferenceKey key, String value) =>
      _sharedPreferences.setString(key.name, value);

  String getString(SharedPreferenceKey key) =>
      _sharedPreferences.getString(key.name);

  Future<bool> putStringList(SharedPreferenceKey key, List<String> value) =>
      _sharedPreferences.setStringList(key.name, value);

  List<String> getStringList(SharedPreferenceKey key) =>
      _sharedPreferences.getStringList(key.name);

  Future<void> removeByKey(SharedPreferenceKey key) =>
      _sharedPreferences.remove(key.name);

  /// Clear is now will set the value of each keys to [Null] excluding
  /// the values from excluded keys.
  Future<void> clear([List<SharedPreferenceKey> exclude]) async =>
      [...SharedPreferenceKey.values]
        ..removeWhere((element) => exclude.contains(element))
        ..forEach(
          (element) {
            if (element != SharedPreferenceKey.keyAccessToken) {
              putString(element, null);
            }
          },
        );
}
