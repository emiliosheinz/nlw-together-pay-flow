import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/bar_code_scanner/bar_code_scanner_page.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
          primaryColor: AppColors.primary, primarySwatch: Colors.orange),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (_) => SplashPage(),
        HomePage.routeName: (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        LoginPage.routeName: (_) => LoginPage(),
        BarCodeScannerPage.routeName: (_) => BarCodeScannerPage(),
        InsertBoletoPage.routeName: (context) {
          final barCode = ModalRoute.of(context)?.settings.arguments;

          return InsertBoletoPage(
            barCode: barCode != null ? barCode.toString() : "",
          );
        },
      },
    );
  }
}
