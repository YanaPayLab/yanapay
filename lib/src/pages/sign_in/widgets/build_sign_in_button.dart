part of '../sign_in_page.dart';

class _BuildSignInButton extends StatelessWidget {
  const _BuildSignInButton({
    required this.emailController,
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return CustomElevatedButton(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        authProvider.isLoading = true;
        // ignore: cascade_invocations
        authProvider.signIn(
          context,
          email: emailController.text,
          password: passwordController.text,
        );
      },
      label: 'Inicia sesión',
    );
  }
}
