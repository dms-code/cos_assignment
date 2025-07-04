//Create a splash screen that will be displayed while the app is loading
//The splash screen will have a logo and a loading animation with background color yellow

import 'package:cos_assignment/core/theme/cos_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  static const String route = "splash";

  const SplashScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).extension<CosThemeExtension>()!;

    return Scaffold(
      backgroundColor: theme.yellow,
      body: Center(
        child: Text('CarOnSale', style: TextStyle(fontSize: theme.subTitle)),
      ),
    );
  }
}