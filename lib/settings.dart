import 'package:first_provider/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text('Settings', style: AppText.heading),
        actions: [
          // Padding(
          //     padding: EdgeInsets.only(right: 16),
          //     child: Icon(
          //       Icons.settings_rounded,
          //       size: 24,
          //     ))
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Dark Mode',
              style: AppText.content,
            ),
            trailing: Switch(onChanged: (v) {}, value: false),
          )
        ],
      ),
    );
  }
}
