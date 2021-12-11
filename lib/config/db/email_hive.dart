import 'package:hive/hive.dart';

import '../../utils/keys.dart';

class EmailHive {
  final emailHive = Hive.box(DBKeys.hive_user_email);

  Future<int> setEmail(String email) async {
    return emailHive.add(email);
  }

  Future<int> clearEmail() async {
    return emailHive.clear();
  }

  Future getEmail() async {
    return emailHive.getAt(0);
  }
}
