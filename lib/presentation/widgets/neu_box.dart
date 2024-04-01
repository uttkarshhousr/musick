import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

  const NeuBox({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color shadowColor;
    if (Theme.of(context).brightness == Brightness.light) {
      shadowColor = Colors.grey.withOpacity(0.2); // Lighter shadow in light mode
    } else {
      shadowColor = Colors.grey.withOpacity(0.5); // Darker shadow in dark mode
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
          Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color:
           shadowColor,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color:
              shadowColor,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
