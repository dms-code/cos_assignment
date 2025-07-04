import 'package:cos_assignment/core/auth/auth.dart';
import 'package:cos_assignment/core/theme/cos_theme.dart';
import 'package:cos_assignment/presentation/views/screens/signup/view/signup_screen.dart';
import 'package:cos_assignment/presentation/views/screens/vehicles/view/vehicles_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/views/screens/splash/splash_screen.dart';

/// The `main` function is the entry point of the application.
/// It runs the application using the [ProviderScope] widget.
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (previous, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (next.user != null) {
          navigatorKey.currentState?.pushNamed(VehiclesScreen.route);
        } else {
          navigatorKey.currentState?.pushNamed(SignUpScreen.route);
        }
      });
    });

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Cos Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 213, 0)),
        useMaterial3: true,
        extensions: <ThemeExtension<dynamic>>[CosThemeExtension()],
      ),
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        SignUpScreen.route: (context) => const SignUpScreen(),
        VehiclesScreen.route: (context) => const VehiclesScreen()
      },
      initialRoute: SplashScreen.route,
    );
  }
}
