/*
import 'package:flutter/material.dart';
import 'package:yanapay/web3/client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YanaPay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'yanapay'),
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
  @override
  Widget build(BuildContext context) {
    // obtenerCinco();
    // crearCuenta();
    // obtenerBalace();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Get five', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/helpers/routes.dart';
import 'package:yanapay/src/helpers/themes.dart';
import 'package:yanapay/src/providers/authentication_provider.dart';
import 'package:yanapay/src/providers/cart_provider.dart';
import 'package:yanapay/src/providers/checkout_provider.dart';
import 'package:yanapay/src/providers/locale_provider.dart';
import 'package:yanapay/src/providers/product_provider.dart';
import 'package:yanapay/src/providers/search_provider.dart';
import 'package:yanapay/src/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => CheckoutProvider()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, theme, locale, snapshot) {
          return GetMaterialApp(
            title: 'YanaPay',
            debugShowCheckedModeBanner: false,
            locale: locale.locale,
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode:
            (theme.isLightTheme == true) ? ThemeMode.light : ThemeMode.dark,
            initialRoute: Routes.splash,
            getPages: allRoutes,
          );
        },
      ),
    );
  }
}
