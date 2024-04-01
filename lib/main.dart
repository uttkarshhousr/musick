import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/config/theme/app_utils.dart';
import 'package:musick/config/theme/light_mode.dart';
import 'package:musick/data/repositories/songRepo/fetch_songdata.dart';
import 'package:musick/firebase_options.dart';
import 'package:musick/presentation/cubits/Authentication/authentication_cubit.dart';
import 'package:musick/presentation/cubits/Authentication/signUp_cubit.dart';
import 'package:musick/presentation/cubits/song/song_cubit.dart';
import 'package:musick/presentation/pages/authScreens/authentication_screen.dart';
import 'config/router/routes.dart';
import 'config/theme/dark_mode.dart';
import 'presentation/cubits/theme/themeMode_cubit.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp( MyApp());
}final Routes _routes = Routes();
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(FirebaseAuth.instance)..appStarted(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(FirebaseAuth.instance),
        ),
        BlocProvider<ThemeModeCubit>(
          create: (context) => ThemeModeCubit(),
        ),BlocProvider<SongCubit>(
          create: (context) => SongCubit(SongDataRepository().fetchSongData()),
        ),
        // Add more BlocProviders for other functionalities
      ],
      child: BlocBuilder<ThemeModeCubit, AppThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: _routes.onGenerateRoute,
            theme: themeMode == AppThemeMode.light ? lightMode : darkMode,
            title: 'Welcome to Flutter',
            home: AuthenticationScreen()
          );
        },
      ),
    );
  }
}



