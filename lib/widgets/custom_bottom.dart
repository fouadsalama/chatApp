import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  String? text;
  VoidCallback? onTap;

  CustomBottom({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              color: Color(0xff2B475E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
