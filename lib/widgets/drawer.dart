import 'package:fetch_flow/core/app_theme/app_colors.dart';
import 'package:fetch_flow/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';




class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      backgroundColor: whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: blackColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30, color: Colors.black),
                ),
                const SizedBox(height: 12),
                Text(
                  'Welcome!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'user@example.com',
                  style: TextStyle(color: Colors.grey[300], fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: blackColor),
            title: Text('Home', style: AppTextStyles.normalText),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: blackColor),
            title: Text('Profile', style: AppTextStyles.normalText),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: blackColor),
            title: Text('Settings', style: AppTextStyles.normalText),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: blackColor),
            title: Text('Logout', style: AppTextStyles.normalText),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
