
import 'package:flutter/material.dart';
import 'package:musick/data/datasources/song_data.dart';
import 'package:musick/data/models/song/song_model.dart';
import 'package:musick/presentation/pages/authScreens/authentication_screen.dart';
import 'package:musick/presentation/pages/authScreens/signIn_form.dart';

import 'package:musick/presentation/pages/homeScreen/home_screen.dart';
import 'package:musick/presentation/pages/splash_screen.dart';
import 'package:musick/presentation/widgets/audioplayer/custom_audioplayer.dart';

class Routes {
  Route? onGenerateRoute(RouteSettings settings) {
    // switch (settings.name) {
    //   case "/homepage":
    //     return MaterialPageRoute(
    //       builder: (context) => const HomeScreen(),
    //     );
    // }
    switch (settings.name) {
      case "/AuthenticationScreen":
        return MaterialPageRoute(
          builder: (context) => const AuthenticationScreen(),
        );
    }switch (settings.name) {
      case "/splashScreen":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }switch (settings.name) {

      case "/signInForm":
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) =>  SignInForm(isSignIn: args['isSignIn']),
        );
    }switch (settings.name) {
      case "/CustomAudioPlayerScreen":
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) =>  CustomAudioPlayerScreen(song: args['song'],index: args['index'],isplaying:args['isplaying']??true ,),
        );
    }
  }
}
