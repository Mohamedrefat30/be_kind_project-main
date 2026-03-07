import 'package:flutter/material.dart';

class TheDots extends StatelessWidget {
  const TheDots({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff9C6B73) : const Color(0xffD9D9D9),
        shape: BoxShape.circle,
      ),
    );
  }
}
