import 'package:flutter/cupertino.dart';
import 'package:flutter_application_8_1/database/transaction_db.dart';
import 'package:flutter_application_8_1/model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.insertData(statement);
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }
}
