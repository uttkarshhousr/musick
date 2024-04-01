import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:musick/config/theme/app_utils.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:musick/presentation/widgets/buttons/gradient_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage(AppImages.weknd), fit: BoxFit.cover)),
          //   child:const Scaffold(
          //     backgroundColor: Colors.transparent,
          //
          //   ),
          // ),
          Animate(
            effects: [FadeEffect(), ScaleEffect()],
            child:           Image.network(
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
          ),

          // Container(
          //   color: Colors.grey.withOpacity(0.3),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                     const SizedBox(height: 100,),
                      Hero(
                        tag: "logo",
                        child: Text(
                          "M U S I C K",
                          textAlign: TextAlign.center,
                          style: myThemelogo.textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w200,fontSize: 70),
                        ),
                      ),
                    ],
                  ), Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Find Music \nFind Your Vibe ",
                        textAlign: TextAlign.center,
                        style: myThemePlayfair.textTheme.titleLarge?.copyWith(
                            color: AppColor.black, fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Hero(
                        tag: 1,
                        child: GradientButton(
                            title: "Sign Up",
                            isDisable: true,
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  arguments: {
                                    "isSignIn": false
                                  },
                                  '/signInForm');
                            }),
                      ),
                      const SizedBox(height: 15),
                      Hero(
                        tag: 2,
                        child: GradientButton(
                            title: "Log In",
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  arguments: {
                                    "isSignIn": true
                                  },
                                  '/signInForm');

                            }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
