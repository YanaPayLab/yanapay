part of '../sign_in_page.dart';

class _BuildRegisterButton extends StatelessWidget {
  const _BuildRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'No tienes una cuenta?',
            style: theme.textTheme.bodyLarge,
          ),
          CustomTextButton(
            label: 'registrate',
            enableUnderline: true,
            textColor: theme.primaryColor,
            onTap: () => Get.toNamed<dynamic>(Routes.signUp),
          )
        ],
      ),
    );
  }
}
