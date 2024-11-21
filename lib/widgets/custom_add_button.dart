import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  final Function()? onTap;

  const CustomAddButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFFEEDFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.add,
          color: Color(0xFFF83EFF),
        ),
      ),
    );
  }
}
