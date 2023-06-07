import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserKey = "ISLOGGEDIN";
  static String sharedPreferenceApiToken = "APITOKEN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserIdKey = "USERNAMEID";
  static String sharedPreferenceUserEmailKey = "USERMAILKEY";
  static String sharedPreferenceUserPeriod = "USERPERIOD";

  static Future<bool> saveUserLoggedInPreference(bool userLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceUserKey, userLoggedIn);
  }

  static Future<bool> saveApiTokenPreference(String apiToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceApiToken, apiToken);
  }

  static Future<bool> saveUserNamePreference(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmailPreference(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  static Future<bool> saveUserIdPreference(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(sharedPreferenceUserIdKey, userId);
  }

  static Future<bool> saveUserPeriod(String userPeriod) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserPeriod, userPeriod);
  }

  static Future<bool> getUserLoggedInPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPreferenceUserKey) ?? false;
  }

  static Future<String?> getApiTokenPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceApiToken);
  }

  static Future<String?> getUserNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString(sharedPreferenceUserNameKey) ?? '123456789');
  }

  static Future<int?> getUserIdPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(sharedPreferenceUserIdKey);
  }

  static Future<String?> getUserEmailPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString(sharedPreferenceUserEmailKey) ?? 'some@gmail.com');
  }

  static Future<String?> getUserPeriodPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString(sharedPreferenceUserPeriod) ?? '2024-1');
  }
}
