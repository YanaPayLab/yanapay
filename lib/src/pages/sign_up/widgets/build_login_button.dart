part of '../sign_up_page.dart';

class _BuildLoginButton extends StatelessWidget {
  const _BuildLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'Ya tengo una cuenta',
            style: theme.textTheme.bodyLarge,
          ),
          CustomTextButton(
            label: 'iniciar sesión',
            enableUnderline: true,
            textColor: theme.primaryColor,
            onTap: () => Get.back<dynamic>(),
          )
        ],
      ),
    );
  }
}
