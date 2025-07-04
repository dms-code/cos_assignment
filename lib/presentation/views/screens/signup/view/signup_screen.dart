import 'package:cos_assignment/core/auth/auth.dart';
import 'package:cos_assignment/core/theme/cos_theme.dart';
import 'package:cos_assignment/presentation/views/screens/signup/viewmodel/signup_view_model.dart';
import 'package:cos_assignment/presentation/views/screens/vehicles/view/vehicles_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The `SignUpScreen` is the primary interface for user registration.
///
/// It provides users with the ability to register for an account using their
/// email address. The screen dynamically updates to reflect the email validation state.
/// 
class SignUpScreen extends ConsumerWidget {
  static String route = "signup";
  final String welcome = "Welcome to CarOnSale";
  final String action = "Please enter your email:";
  final String cta = "Sign Up";
  final String label = "Email";
  final double top = 10;
  final double left = 10;
  final double right = 10;
  final double titleSize = 28;
  final double actionSize = 18;

  const SignUpScreen({super.key});

  void _openHomeScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, VehiclesScreen.route);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cosTheme = Theme.of(context).extension<CosThemeExtension>()!;
    final auth = ref.watch(authProvider);

    if (auth.isLogged()) {
      _openHomeScreen(context);
    }

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(top: top, left: left, right: right),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(welcome, style: TextStyle(fontSize: titleSize)),
                    cosTheme.smallVSpace(),
                    Text(action, style: TextStyle(fontSize: actionSize)),
                    cosTheme.mediumVSpace(),
                    _buildForm(ref, cosTheme),
                  ],
                ))));
  }

  Widget _buildForm(WidgetRef ref, CosThemeExtension theme) {
    final signUpVM = ref.watch(signUpScreenVMProvider.notifier);

    return StreamBuilder(
        stream: signUpVM.emailStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return _buildEmptyForm(ref, theme);
          }

          final either = snapshot.data!;

          return either.fold(
            (success) => _buildSubmitForm(ref, theme),
            (error) => _buildErrorForm(ref, theme),
          );
        });
  }

  Widget _buildEmptyForm(WidgetRef ref, CosThemeExtension theme) {
    final signUpVM = ref.read(signUpScreenVMProvider.notifier);

    return Column(
      children: [
        TextField(
          onChanged: (value) => signUpVM.setEmail(value),
        ),
        theme.largeVSpace(),
        _submitButton(ref, false)
      ],
    );
  }

  Widget _buildSubmitForm(WidgetRef ref, CosThemeExtension theme) {
    final signUpVM = ref.read(signUpScreenVMProvider.notifier);

    return Column(
      children: [
        TextField(
          onChanged: (value) => signUpVM.setEmail(value),
        ),
        theme.largeVSpace(),
        _submitButton(ref, true)
      ],
    );
  }

  Widget _buildErrorForm(WidgetRef ref, CosThemeExtension theme) {
    final signUpVM = ref.read(signUpScreenVMProvider.notifier);
    final signUpState = ref.read(signUpScreenVMProvider);
    return Column(
      children: [
        TextField(
          onChanged: (value) => signUpVM.setEmail(value),
          decoration: InputDecoration(errorText: signUpState.emailError!),
        ),
        theme.largeVSpace(),
        _submitButton(ref, false)
      ],
    );
  }

  Widget _submitButton(WidgetRef ref, bool enabled) {
    final signUpVM = ref.read(signUpScreenVMProvider.notifier);

    return Center(
      child: ElevatedButton(
        onPressed: enabled ? () => signUpVM.saveUser() : null,
        style: enabled
            ? null
            : ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.grey.shade600,
              ),
        child: Text(cta),
      ),
    );
  }
}
