import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool ledEnabled = false;
  bool hapticsEnabled = false;
  bool notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            
            SizedBox(height: 16),
            _buildToggleRow(
              'LED',
              ledEnabled,
              (bool newValue) {
                setState(() {
                  ledEnabled = newValue;
                });
              },
            ),
            _buildToggleRow(
              'Haptics',
              hapticsEnabled,
              (bool newValue) {
                setState(() {
                  hapticsEnabled = newValue;
                });
              },
            ),
            _buildToggleRow(
              'Notifications',
              notificationsEnabled,
              (bool newValue) {
                setState(() {
                  notificationsEnabled = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleRow(String label, bool currentValue, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Switch(
          value: currentValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
