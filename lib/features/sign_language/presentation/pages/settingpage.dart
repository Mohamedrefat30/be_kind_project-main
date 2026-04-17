import 'package:be_kind_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildSettingItem(
              icon: Icons.language,
              title: 'Language',
              subtitle: 'English',
              trailing: _buildLanguageDropdown(),
              iconColor: const Color(0xFFE8D5D8),
            ),
            _buildSettingItem(
              icon: Icons.dark_mode,
              title: 'Dark Mode',
              trailing: Switch(
                value: false,
                onChanged: (val) {},
                activeThumbColor: AppColors.accent,
              ),
              iconColor: const Color(0xFFF2DADC),
            ),
            _buildSettingItem(
              icon: Icons.notifications,
              title: 'Notification',
              trailing: Switch(
                value: true,
                onChanged: (val) {},
                activeThumbColor: AppColors.accent,
              ),
              iconColor: const Color(0xFFFFF0D1),
            ),
            _buildSettingItem(
              icon: Icons.info_outline,
              title: 'About Us',
              iconColor: const Color(0xFFD1F5FF),
              onTap: () {},
            ),
            _buildSettingItem(
              icon: Icons.email_outlined,
              title: 'Contact Us',
              iconColor: const Color(0xFFD1FFDA),
              onTap: () {},
            ),
            _buildSettingItem(
              icon: Icons.star_border,
              title: 'Rate Us',
              iconColor: const Color(0xFFFFEBD1),
              onTap: () {},
            ),
            _buildSettingItem(
              icon: Icons.logout,
              title: 'Log Out',
              iconColor: const Color(0xFFFFD1D1),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required Color iconColor,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.black54),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: subtitle != null
            ? Text(subtitle, style: const TextStyle(color: Colors.grey))
            : null,
        trailing:
            trailing ??
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF2DADC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('English', style: TextStyle(fontSize: 12)),
          Icon(Icons.keyboard_arrow_down, size: 16),
        ],
      ),
    );
  }
}
