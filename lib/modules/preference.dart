
import 'package:shared_preferences/shared_preferences.dart';

class SimpleUserPreferences{
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  static Future setNameSignalPage( String value) async {
    await _prefs.setString('stockName', value);
}
  static String? getNameSignalPage() {
    return _prefs.getString('stockName');
  }
}