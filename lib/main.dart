import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_project/provider/cart_provider.dart';
import 'package:new_project/provider/productProvider.dart';
import 'package:new_project/screen/first_screen.dart';
import 'package:new_project/screen/product.dart';
import 'package:new_project/screen/sign_in_up.dart';
import 'package:new_project/screen/slider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: ((context) => Cart()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const FisrtScreenN(),
      ),
    );
  }
}
