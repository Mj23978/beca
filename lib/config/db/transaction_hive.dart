import 'package:hive/hive.dart';

import '../../models/base/base.dart';
import '../../utils/keys.dart';

class BaseHive {
  final box = Hive.box(DBKeys.hive_transactions);

  Future<void> putBase(Base transaction) async {
    await box.add(transaction.toJson());
  }
  
  Future<void> putBases(List<Base> transactions) async {
    await box.addAll(transactions.map((v) => v.toJson()));
  }

  Future<void> putBaseAt(Base transaction, int index) async {
    await box.putAt(index, transaction.toJson());
  }

  Future<int> clearBases() async {
    return await box.clear();
  }

  Future<int> updateBase() async {
    return await box.clear();
  }

  List<Base> getBases() {
    final transactionsMap = box.toMap();
    final List<Base> transactions = [];
    for (final project in transactionsMap.entries) {
      transactions.add(Base.fromJson(Map<String, dynamic>.from(project.value)));
    }
    return transactions;
  }

  Base getBase(int index) {
    final transaction = Map<String, dynamic>.from(box.getAt(index));
    final res = Base.fromJson(transaction);
    return res;
  }
}
