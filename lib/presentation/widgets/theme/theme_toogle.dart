import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/theme/themeMode_cubit.dart';

class ThemeToogleButton extends StatelessWidget {
  const ThemeToogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        context.read<ThemeModeCubit>().toggleTheme();
      },
      child: Text('Toggle Theme'),
    );
  }
}