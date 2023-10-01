part of '../sign_in_page.dart';

class _BuildPasswordTextField extends StatelessWidget {
  const _BuildPasswordTextField({
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authProv = Provider.of<AuthenticationProvider>(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1100),
      child: CustomTextFormField(
        controller: passwordController,
        obscureText: authProv.obscureText,
        borderType: BorderType.outline,
        textFieldType: TextFieldType.password,
        hintText: 'Contraseña',
        prefixIcon: Icon(
          FeatherIcons.lock,
          color: theme.primaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            (authProv.obscureText == true)
                ? FeatherIcons.eye
                : FeatherIcons.eyeOff,
          ),
          color: theme.primaryColor,
          onPressed: authProv.obscureTextChanged,
        ),
      ),
    );
  }
}
