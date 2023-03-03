import 'package:flutter/material.dart';
import 'package:flutter_application_8_1/providers/transaction_provider.dart';

import 'package:flutter_application_8_1/screens/home_screen.dart';
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
        home: const MyHomePage(
          title: '',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.green,
          body: TabBarView(children: [
            FormScreen(),
            const HomeScreen(),
          ]),
          bottomNavigationBar: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.list),
            )
          ]),
        ));
  }
}
