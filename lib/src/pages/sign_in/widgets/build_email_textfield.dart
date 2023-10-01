part of '../sign_in_page.dart';

class _BuildEmailTextField extends StatelessWidget {
  const _BuildEmailTextField({
    required this.emailController,
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1000),
      child: CustomTextFormField(
        controller: emailController,
        borderType: BorderType.outline,
        textFieldType: TextFieldType.email,
        hintText: 'Correo electrónico',
        prefixIcon: Icon(
          FeatherIcons.mail,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
