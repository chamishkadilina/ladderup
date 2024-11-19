import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                // print('Tapped !');
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xFF754BE5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
