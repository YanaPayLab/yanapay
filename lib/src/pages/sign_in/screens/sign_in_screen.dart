part of '../sign_in_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          const SizedBox(height: 150),
          const _BuildLogo(),
          const SizedBox(height: 100),
          _BuildEmailTextField(emailController: _emailController),
          const SizedBox(height: Const.space25),
          _BuildPasswordTextField(
            passwordController: _passwordController,
          ),
          const SizedBox(height: Const.space25),
          if (authProvider.isLoading)
            const CustomLoadingIndicator()
          else
            _BuildSignInButton(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
          const SizedBox(height: Const.space12),
          const _BuildRegisterButton()
        ],
      ),
    );
  }
}
