import 'package:flutter/material.dart';

/// The `CosThemeExtension` is a theme extension class that provides access to the theme custom fields.

class CosThemeExtension extends ThemeExtension<CosThemeExtension> {
  final double smallSpace = 5;
  final double mediumSpace = 10;
  final double largeSpace = 20;
  final double pad10 = 10;
  final double title = 24;
  final double subTitle = 18;

  final Color yellow = const Color.fromARGB(224, 250, 188, 4);
  

  SizedBox smallVSpace(){
    return SizedBox(height: smallSpace);
  }

  SizedBox mediumVSpace(){
    return SizedBox(height: mediumSpace);
  }

  SizedBox largeVSpace(){
    return SizedBox(height: largeSpace);
  }
  
    @override
  CosThemeExtension copyWith() {
    return CosThemeExtension();
  }

  @override
  CosThemeExtension lerp(ThemeExtension<CosThemeExtension>? other, double t) {
    return this;
  }
  
}
