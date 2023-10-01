part of '../sign_up_page.dart';

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
      duration: const Duration(milliseconds: 1100),
      child: CustomTextFormField(
        controller: emailController,
        borderType: BorderType.outline,
        textFieldType: TextFieldType.email,
        hintText: 'email',
        prefixIcon: Icon(
          FeatherIcons.mail,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
