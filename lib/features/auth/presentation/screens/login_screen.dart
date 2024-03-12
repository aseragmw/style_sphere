// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool obsecurePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const CustomAppBar(),
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenAwareWidth(20, context)),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 90,
//                   ),
//                   const Text(
//                     'Login',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: screenAwareHeight(32, context),
//                   ),
//                   CustomTextField(
//                     hint: 'Enter your email address',
//                     textEditingController: emailController,
//                   ),
//                   SizedBox(height: screenAwareHeight(24, context)),
//                   CustomTextField(
//                     hint: 'Enter your password',
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           obsecurePassword = !obsecurePassword;
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.remove_red_eye_rounded,
//                         color: AppTheme.greyTwoColor,
//                       ),
//                     ),
//                     obscureText: obsecurePassword,
//                     textEditingController: passwordController,
//                   ),
//                   SizedBox(height: screenAwareHeight(32, context)),
//                   BlocConsumer<AuthBloc, AuthState>(
//                     builder: (context, state) {
//                       if (state is LoginLoadingState) {
//                         log('hery');
//                         return CustomButton(
//                           title: 'Login',
//                           onPress: () {
//                             context.read<AuthBloc>().add(LoginEvent(email: emailController.text, password: passwordController.text));
//                           },
//                           buttonColor: AppTheme.primaryColor,
//                           borderRadius: AppTheme.boxRadius,
//                           borderColor: null,
//                           isLoading: true,
//                           fontColor: Colors.white,
//                           fontSize: AppTheme.fontSize16(context),
//                         );
//                       } else {
//                         return CustomButton(
//                           title: 'Login',
//                           onPress: () {
//                             if (
//                                 emailController.text.isNotEmpty &&
//                                 passwordController.text.isNotEmpty ) {
//                                                               context.read<AuthBloc>().add(LoginEvent(email: emailController.text, password: passwordController.text));

//                               }  else {
//                                                             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('''All fields are required''')));

//                             }
//                           },
//                           buttonColor: AppTheme.primaryColor,
//                           borderRadius: AppTheme.boxRadius,
//                           borderColor: null,
//                           isLoading: false,
//                           fontColor: Colors.white,
//                           fontSize: AppTheme.fontSize16(context),
//                         );
//                       }
//                     },
//                     listener: (context, state) {
//                       if (state is LoginSuccessState) {
//                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login done')));
//                         Navigator.of(context)
//                             .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
//                       } else if (state is LoginErrorState) {
//                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed')));
//                       }
//                     },
//                   ),
//                   SizedBox(
//                     height: screenAwareHeight(20, context),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         '''Don't you have an account?''',
//                         style: TextStyle(
//                             fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight500, color: AppTheme.blackColor),
//                       ),
//                       const SizedBox(
//                         width: 4,
//                       ),
//                       InkWell(
//                         child: Text(
//                           'Sign up here',
//                           style: TextStyle(
//                               fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight700, color: AppTheme.blackColor),
//                         ),
//                         onTap: () => Navigator.of(context)
//                             .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignUpScreen()), (route) => false),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
