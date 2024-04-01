import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/presentation/pages/authScreens/signIn_form.dart';
import 'package:musick/presentation/pages/homeScreen/home_screen.dart';
import 'package:musick/presentation/pages/splash_screen.dart';
import '../../cubits/Authentication/authentication_cubit.dart';
import '../../widgets/theme/theme_toogle.dart';
import '';
class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(

      body: Center(
        child: BlocBuilder<AuthenticationCubit, AuthenticationStatus>(
          builder: (context, state) {
            if (state == AuthenticationStatus.authenticated) {
              return HomeScreen(authContext: context,);
            } else if (state == AuthenticationStatus.unauthenticated) {
              return SplashScreen();
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
