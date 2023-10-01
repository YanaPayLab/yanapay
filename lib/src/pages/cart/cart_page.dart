import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/helpers/screens.dart';
import 'package:yanapay/src/helpers/snack_toast.dart';
import 'package:yanapay/src/list_data/cart_list.dart';
import 'package:yanapay/src/models/checkout_model.dart';
import 'package:yanapay/src/providers/cart_provider.dart';
import 'package:yanapay/src/widgets/cart_card.dart';
import 'package:yanapay/src/widgets/custom_app_bar.dart';
import 'package:yanapay/src/widgets/custom_elevated_button.dart';
import 'package:yanapay/src/widgets/empty_section.dart';
import 'package:yanapay/web3/client.dart';

part 'screens/cart_screen.dart';
part 'widgets/footer_section.dart';
part 'widgets/build_body.dart';
