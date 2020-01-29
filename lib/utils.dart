
import 'package:shared_preferences/shared_preferences.dart';
class utils{
   Future<String> readKey() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userid';
    final value = prefs.getString(key) ?? 0;
   return value;
  }

   Future<bool> cekKey() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userid';
    return prefs.getString(key)?? false;
  }

   void saveKey(String userid) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userid';
    prefs.setString(key, userid);
  }


   void removeKey() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userid';
    prefs.remove(key);
  }
}