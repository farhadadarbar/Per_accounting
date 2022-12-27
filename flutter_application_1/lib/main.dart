import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/MyHomePage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'dimonApp/route_generator.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://e1cd9ec862ca42e7b60fdc8acd39582a@o4503902736089089.ingest.sentry.io/4503902737596416';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );
}

// void main() {
//   HttpOverrides.global = MyHttpOverrides();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Kurdishlight",
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home:
          Directionality(textDirection: TextDirection.rtl, child: MyHomePage()),
    );
  }
}
