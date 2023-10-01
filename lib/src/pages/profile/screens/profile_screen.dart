part of '../profile_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: 'Perfil',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(Routes.profileDetail),
            leading: Icon(FeatherIcons.user, color: theme.hintColor),
            title: AutoSizeText(
              'Detalle de perfil',
              style: theme.textTheme.headlineSmall,
            ),
            trailing: Icon(
              FeatherIcons.chevronRight,
              size: 16,
              color: theme.hintColor,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(Routes.order),
            leading: Icon(FeatherIcons.truck, color: theme.hintColor),
            title: AutoSizeText(
              'Mis ordenes',
              style: theme.textTheme.headlineSmall,
            ),
            trailing: Icon(
              FeatherIcons.chevronRight,
              size: 16,
              color: theme.hintColor,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            leading: Icon(FeatherIcons.sun, color: theme.hintColor),
            title: AutoSizeText(
              'Modo ${themeProvider.isLightTheme ? 'oscuro' : 'claro'}',
              style: theme.textTheme.headlineSmall,
            ),
            trailing: Switch(
              value: themeProvider.isLightTheme,
              activeColor: theme.primaryColor,
              onChanged: (v) => themeProvider.changeTheme(),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.toNamed<dynamic>(Routes.splash),
            leading: Icon(FeatherIcons.logOut, color: theme.hintColor),
            title: AutoSizeText(
              'Salir',
              style: theme.textTheme.headlineSmall,
            ),
            trailing: Icon(
              FeatherIcons.chevronRight,
              size: 16,
              color: theme.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
