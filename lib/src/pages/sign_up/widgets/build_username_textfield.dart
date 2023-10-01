part of '../sign_up_page.dart';

class _BuildUsernameTextField extends StatelessWidget {
  const _BuildUsernameTextField({
    required this.usernameController,
    Key? key,
  }) : super(key: key);

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1000),
      child: CustomTextFormField(
        controller: usernameController,
        borderType: BorderType.outline,
        hintText: 'username',
        prefixIcon: Icon(
          FeatherIcons.mail,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
