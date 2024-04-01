
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/presentation/cubits/Authentication/authentication_cubit.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      ElevatedButton(
        onPressed: () {
          context.read<AuthenticationCubit>().loggedOut();
        },
        child: const Text("sign Out"),
      )
    );
  }
}