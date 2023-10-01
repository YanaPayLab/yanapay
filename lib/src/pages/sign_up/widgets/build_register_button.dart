part of '../sign_up_page.dart';

class _BuildRegisterButton extends StatelessWidget {
  const _BuildRegisterButton({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthenticationProvider>(context);

    return CustomElevatedButton(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        authProv.isLoading = true;
        // ignore: cascade_invocations
        authProv.signUp(
          context,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
        );
      },
      label: 'Registrar',
    );
  }
}
