
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'lang/translation_service.dart';


Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Utils.getColor(ColorCode.blue)));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              enableLog: true,
              navigatorKey: NavigationService.navigatorKey,
              locale: const Locale('en', 'US'),
              translations: TranslationService(),
              getPages: [
                GetPage(name: RouteInfo.splashscreen, page: () => SplashScreen(), binding: SplashBinding()),
              ],
              initialRoute: kIsWeb ? RouteInfo.loginscreen : RouteInfo.splashscreen);
          // RouteInfo.splashscreen);
        });
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

