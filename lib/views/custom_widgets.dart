import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomWidget {
  static String formatDate(String? time) {
    DateTime? date = DateTime.tryParse(time ?? '');
    if (date != null) {
      return DateFormat('yyyy-MM-dd hh:mm a').format(date);
    }
    return '';
  }

  Widget customDropdown(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Sujoy Chandra Das',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Top News'),
            leading: const Icon(Icons.star),
            onTap: () {
              // Handle top news tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Categories'),
            leading: const Icon(Icons.category),
            onTap: () {
              // Handle categories tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Sources'),
            leading: const Icon(Icons.language),
            onTap: () {
              // Handle sources tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          const Divider(), 
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              // Handle settings tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              // Handle logout tap
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
