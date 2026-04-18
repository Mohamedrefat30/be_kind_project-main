import 'package:be_kind_project/features/splash/presentation/pages/splash_page.dart';
import 'package:be_kind_project/setting/About_us/about_us.dart';
import 'package:be_kind_project/setting/contact_us/contact_us.dart';
import 'package:be_kind_project/setting/log_out/log_out.dart';
import 'package:be_kind_project/setting/rate_us/rate_us.dart';
import 'package:flutter/material.dart';

import 'features/sign_language/presentation/pages/settingpage.dart';

class BeKindApp extends StatelessWidget {
  const BeKindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SettingsPage(),
    );
  }
}
