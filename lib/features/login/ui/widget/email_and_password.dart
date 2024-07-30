import 'package:doc_app/core/helpers/app_regex.dart';
import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/widget/app_text_form_field.dart';
import 'package:doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/login/ui/widget/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_complete_project/core/helpers/app_regex.dart';
// import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';

// import '../../../../core/helpers/spacing.dart';
// import '../../../../core/widgets/app_text_form_field.dart';
// import 'password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
   // Set up the listener for the password text field
  setupPasswordControllerListener();
}

void setupPasswordControllerListener() {
  // Add a listener to the text field to monitor changes in the password input
  passwordController.addListener(() {
    setState(() {
      // Check if the password contains at least one lowercase letter
      hasLowercase = AppRegex.hasLowerCase(passwordController.text);
      // Check if the password contains at least one uppercase letter
      hasUppercase = AppRegex.hasUpperCase(passwordController.text);
      // Check if the password contains at least one special character
      hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
      // Check if the password contains at least one number
      hasNumber = AppRegex.hasNumber(passwordController.text);
      // Check if the password has a minimum length of 8 characters
      hasMinLength = AppRegex.hasMinLength(passwordController.text);
    });
  });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}