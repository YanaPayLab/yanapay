part of '../profile_detail_page.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);
  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  static const String _userImage =
      'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png';
  static const String _username = 'yanapay';
  static const String _email = 'yanapay@yanapay.com';
  static const String _phoneNumber = '123456798';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: 'profile',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          const Align(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(_userImage),
            ),
          ),
          const SizedBox(height: Const.space25),
          _BuildProfileTile(
            label: 'Nombre de usuario',
            text: _username,
          ),
          const SizedBox(height: Const.space15),
          _BuildProfileTile(
            label: 'Correo electrónico',
            text: _email,
          ),
          const SizedBox(height: Const.space15),
          _BuildProfileTile(
            label: 'Número de teléfono',
            text: _phoneNumber,
          ),
          const SizedBox(height: Const.space15),
        ],
      ),
    );
  }
}
