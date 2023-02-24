import 'package:flutter/material.dart';
import 'package:flutter_application_8_1/providers/transaction_provider.dart';
import 'package:flutter_application_8_1/screens/home.dart';
import 'package:provider/provider.dart';
import 'screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return TransactionProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const MyHomePage(title: 'แอปรายจ่าย'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
