import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musick/config/theme/app_utils.dart';
import 'package:musick/config/theme/theme_data.dart';

class EmailInputField extends StatefulWidget {
  var formkey;
  TextEditingController passwordController;
  TextEditingController emailController;
   EmailInputField({super.key,this.formkey,required this.emailController,required this.passwordController});
  @override
  _EmailInputFieldState createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key:widget.formkey,
      child: Column(
        children: [
          TextFormField(
            controller:widget.emailController,
            style: myThemePlayfair.textTheme.bodyMedium
                ?.copyWith(color: AppColor.disableButtonTextBlackColor),
            decoration:const InputDecoration(
              errorBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.errorRed),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              // labelText: labelText,
              counterText: '',
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.textFieldColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              // hintText: hintText,
              hintStyle:  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black),
              contentPadding:  EdgeInsets.symmetric(horizontal: 10),
              labelText: 'Email*',
              labelStyle:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black),

              hintText: 'Enter your email',
              suffixIcon: Icon(Icons.headset,color:AppColor.black,),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.textFieldPurpleColor,),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              border:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.borderColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              if (!_emailRegExp.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height:20),
          TextFormField(
            controller: widget.passwordController,
            obscureText: true,
            style: myThemePlayfair.textTheme.bodyMedium
                ?.copyWith(color: AppColor.black),
            decoration:const  InputDecoration(
              labelText: 'Password*',
              hintText: 'Enter your password',
              suffixIcon: Icon(Icons.vpn_key,color: AppColor.black,),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              errorBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.errorRed),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              // labelText: labelText,
              counterText: '',
              border:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.borderColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.textFieldColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              // hintText: hintText,
              hintStyle:  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.borderColor),
              labelStyle:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.textFieldPurpleColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),

            ),

            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              // You can add additional validation for password strength if needed
              return null;
            },
          ),
        ],
      ),
    );
  }
}