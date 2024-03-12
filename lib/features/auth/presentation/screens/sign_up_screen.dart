// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_stock_market/core/utils/app_theme.dart';
// import 'package:mobile_stock_market/core/utils/core_utils.dart';
// import 'package:mobile_stock_market/core/utils/custom_button.dart';
// import 'package:mobile_stock_market/core/widgets/custom_app_bar.dart';
// import 'package:mobile_stock_market/core/widgets/custom_circular_progress_indicator.dart';
// import 'package:mobile_stock_market/core/widgets/custom_text_field.dart';
// import 'package:mobile_stock_market/features/auth/presentation/bloc/bloc/auth_bloc.dart';
// import 'package:mobile_stock_market/features/auth/presentation/screens/confirm_otp_screen.dart';
// import 'package:mobile_stock_market/features/auth/presentation/screens/login_screen.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final emailController = TextEditingController();
//   final nameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   bool obscurePassword = true;
//   bool obscurePasswordConfirm = true;

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
//                   SizedBox(height: screenAwareHeight(54, context)),
//                   const Text(
//                     'Sign Up',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: screenAwareHeight(32, context),
//                   ),
//                   CustomTextField(
//                     hint: 'Enter your full name',
//                     isRequired: true,
//                     textEditingController: nameController,
//                     fillColor: AppTheme.fillColor,
//                   ),
//                   SizedBox(
//                     height: screenAwareHeight(20, context),
//                   ),
//                   CustomTextField(
//                     hint: 'Enter your email address',
//                     textEditingController: emailController,
//                     isRequired: true,
//                     fillColor: AppTheme.fillColor,
//                   ),
//                   SizedBox(
//                     height: screenAwareHeight(20, context),
//                   ),
//                   CustomTextField(
//                     hint: 'Enter your password',
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           obscurePassword = !obscurePassword;
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.remove_red_eye_rounded,
//                         color: AppTheme.greyTwoColor,
//                       ),
//                     ),
//                     obscureText: obscurePassword,
//                     isRequired: true,
//                     textEditingController: passwordController,
//                     fillColor: AppTheme.fillColor,
//                   ),
//                   SizedBox(
//                     height: screenAwareHeight(20, context),
//                   ),
//                   CustomTextField(
//                     hint: 'Confirm your password',
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           obscurePasswordConfirm = !obscurePasswordConfirm;
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.remove_red_eye_rounded,
//                         color: AppTheme.greyTwoColor,
//                       ),
//                     ),
//                     isRequired: true,
//                     obscureText: obscurePasswordConfirm,
//                     textEditingController: confirmPasswordController,
//                     fillColor: AppTheme.fillColor,
//                   ),
//                   SizedBox(
//                     height: screenAwareHeight(30, context),
//                   ),
//                   BlocConsumer<AuthBloc, AuthState>(
//                     builder: (context, state) {
//                       if (state is SignupLoadingState) {
//                         return CustomButton(
//                           title: 'Sign Up',
//                           onPress: () {
//                             context.read<AuthBloc>().add(
//                                 SignupEvent(email: emailController.text, password: passwordController.text, name: nameController.text));
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
//                           title: 'Sign Up',
//                           onPress: () {
//                             print("emailll ${emailController.text}");
//                             print("passwordddd ${passwordController.text}");
//                             print("nameeeeee ${nameController.text}");
//                             if (nameController.text.isNotEmpty &&
//                                 emailController.text.isNotEmpty &&
//                                 passwordController.text.isNotEmpty &&
//                                 confirmPasswordController.text.isNotEmpty) {
//                               if ((passwordController.text == confirmPasswordController.text))
//                                 context.read<AuthBloc>().add(
//                                     SignupEvent(email: emailController.text, password: passwordController.text, name: nameController.text));
//                               else {
//                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('''Passwords aren't compatiable''')));

//                               }
//                             }  
//                              else {
//                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('''All fields are required''')));
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
//                       if (state is SignupSuccessState) {
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(builder: (context) => ConfirmOtpScreen(user: state.user)), (route) => false);
//                       } else if (state is SignupErrorState) {
//                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sign Up failed')));
//                       }
//                     },
//                   ),
//                   SizedBox(
//                     height: screenAwareHeight(16, context),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Do you have an account?',
//                         style: TextStyle(
//                             fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight500, color: AppTheme.blackColor),
//                       ),
//                       const SizedBox(
//                         width: 4,
//                       ),
//                       InkWell(
//                         child: Text(
//                           'Sign in here',
//                           style: TextStyle(
//                               fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight700, color: AppTheme.blackColor),
//                         ),
//                         onTap: () => Navigator.of(context)
//                             .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false),
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
