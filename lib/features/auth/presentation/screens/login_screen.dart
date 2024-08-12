import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_sphere/core/extentions/screen_size.dart';
import 'package:style_sphere/core/utils/app_theme.dart';
import 'package:style_sphere/core/widgets/custom_app_bar.dart';
import 'package:style_sphere/core/widgets/custom_button.dart';
import 'package:style_sphere/core/widgets/custom_text_field.dart';
import 'package:style_sphere/core/widgets/main_layout.dart';
import 'package:style_sphere/features/auth/presentation/bloc/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        children: [
          const CustomAppBar(
            showBackCursor: true,
          ),
          const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          CustomTextField(
            fillColor: AppTheme.whiteColor,
            hintText: "EMAIL",
            trailingIcon: null,
            obsecured: false,
            controller: emailController,
            filled: false,
            borderEnabled: false,
          ),

          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          CustomTextField(
            hintText: "EMAIL",
            trailingIcon: null,
            obsecured: false,
            controller: emailController,
            filled: false,
            borderEnabled: false,
          ),

          // CustomTextField(
          //   hint: 'Enter your password',
          //   suffixIcon: IconButton(
          //     onPressed: () {
          //       setState(() {
          //         obsecurePassword = !obsecurePassword;
          //       });
          //     },
          //     icon: const Icon(
          //       Icons.remove_red_eye_rounded,
          //       color: AppTheme.greyTwoColor,
          //     ),
          //   ),
          //   obscureText: obsecurePassword,
          //   textEditingController: passwordController,
          // ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoginLoadingState) {
                log('hery');
                return CustomButton(
                  title: 'Login',
                  onPress: () {
                    context.read<AuthBloc>().add(LoginEvent(email: emailController.text, password: passwordController.text));
                  },
                  buttonColor: AppTheme.redColor,
                  borderRadius: AppTheme.boxRadius,
                  borderColor: null,
                  // isLoading: true,
                  fontColor: Colors.white,
                  fontSize: AppTheme.fontSize16(context), buttonWidth: context.screenWidth * 0.8,
                );
              } else {
                return CustomButton(
                  buttonHeight: context.screenHeight * 0.1,
                  title: 'Login',
                  onPress: () {
                    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      context.read<AuthBloc>().add(LoginEvent(email: emailController.text, password: passwordController.text));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('''All fields are required''')));
                    }
                  },
                  buttonColor: AppTheme.redColor,
                  borderRadius: AppTheme.boxRadius,
                  borderColor: null,
                  // isLoading: false,
                  fontColor: Colors.white,
                  fontSize: AppTheme.fontSize16(context), buttonWidth: context.screenWidth * 0.8,
                );
              }
            },
            listener: (context, state) {
              if (state is LoginSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login done')));
                // Navigator.of(context)
                // .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
              } else if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed')));
              }
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '''Don't you have an account?''',
                style: TextStyle(fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight500, color: AppTheme.blackColor),
              ),
              const SizedBox(
                width: 4,
              ),
              InkWell(
                child: Text(
                  'Sign up here',
                  style: TextStyle(fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight700, color: AppTheme.blackColor),
                ),
                // onTap: () => Navigator.of(context)
                //     .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignUpScreen()), (route) => false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
