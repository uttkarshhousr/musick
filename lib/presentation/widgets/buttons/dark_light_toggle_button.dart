import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/presentation/cubits/theme/themeMode_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DarkLightToggleButton extends StatefulWidget {
  final bool isDarkModeOn;

  const DarkLightToggleButton({Key? key, required this.isDarkModeOn}) : super(key: key);

  @override
  _DarkLightToggleButtonState createState() => _DarkLightToggleButtonState();
}

class _DarkLightToggleButtonState extends State<DarkLightToggleButton> {
  int currentModeIndex = 0; // Initialize with dark mode index

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 50.0,
      minHeight: 30.0,
      initialLabelIndex: widget.isDarkModeOn ? 1 : 0,
      cornerRadius: 10.0,
      activeBgColor: [Colors.grey[200]!],
      inactiveBgColor: Colors.grey[700],
      activeFgColor: Colors.black,
      inactiveFgColor:Colors.white,
      totalSwitches: 2,
      icons: [
        Icons.nightlight_round,
        Icons.wb_sunny_rounded,
      ],
      iconSize: 30.0,
      animate: false,
      onToggle: (index) {
        if (index != currentModeIndex) {
          currentModeIndex = index!;
          context.read<ThemeModeCubit>().toggleTheme();
        }
      },
    );
  }
}
