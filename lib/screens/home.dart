import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_8_1/providers/transaction_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/transaction.dart';
import 'form_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormScreen();
                }));
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ))
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            // ignore: prefer_const_constructors
            return Center(
              child: const Text(
                "ไม่พบข้อมูล",
                style: TextStyle(fontSize: 35),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (context, int index) {
                Transactions data = provider.transactions[index];
                // ignore: prefer_const_constructors
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(
                        child: Text(data.amount.toString()),
                      ),
                    ),
                    title: Text(data.title),
                    subtitle: Text(
                        DateFormat("dd/MM/yyyy HH:mm:ss").format(data.date)),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
