import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/config/theme/app_utils.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:musick/presentation/cubits/Authentication/signUp_cubit.dart';
import 'package:musick/presentation/pages/homeScreen/home_screen.dart';
import 'package:musick/presentation/widgets/Inputfield/email_textfield.dart';
import 'package:musick/presentation/widgets/buttons/gradient_button.dart';

import '../../cubits/Authentication/authentication_cubit.dart';

class SignInForm extends StatelessWidget {
  final isSignIn;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SignInForm({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationStatus>(
        builder: (context, state) {
     return Scaffold(
      body: Stack(
        children:[

          Image.network(
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
          Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        Hero(
                          tag: "logo",
                          child: Padding(
                            padding: const EdgeInsets.only(top: 150.0),
                            child: Column(
                              children: [
                                Text(
                                  "M U S I C K",
                                  textAlign: TextAlign.center,
                                  style: myThemelogo.textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w200,fontSize: 70),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.stretch,
                                     children: [
                                       const SizedBox(height: 30),
                                       EmailInputField(
                                         formkey: _formKey,
                                         emailController: emailController,
                                         passwordController: passwordController,
                                       ),
                                       const SizedBox(height: 30),
                                       Hero(
                                         tag: 1,
                                         child: GradientButton(
                                           title:isSignIn? 'Log In':'Sign Up',
                                           onPressed: () {
                                             if (_formKey.currentState!.validate()) {
                                               isSignIn
                           ? context.read<AuthenticationCubit>().loggedIn(
                               emailController.text, passwordController.text)
                           : context.read<SignUpCubit>().signUp(
                               emailController.text, passwordController.text);
                                               // Form is valid, handle submission
                                               // For now, let's print the email
                                             }
                                           },
                                         ),
                                       ),
                                     ],
                          ),
                        ),

                        // const SizedBox(height: 30),

                        // TextField(
                        //   controller: emailController,
                        //   decoration: InputDecoration(labelText: 'Email'),
                        // ),
                        // TextField(
                        //   controller: passwordController,
                        //   decoration: InputDecoration(labelText: 'Password'),
                        //   obscureText: true,
                        // ),
                        // SizedBox(height: 20.0),
                      ],
                    ),
                  ),

        ],
      ),);},
        listener: (context, state) {

           if (state == AuthenticationStatus.authenticated) {
             Navigator.of(context).pushNamedAndRemoveUntil(
                 '/AuthenticationScreen', (Route<dynamic> route) => false);

          }
        }

    );

  }
}
