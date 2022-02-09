import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  IconData icon;
  BottomIcons({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2,color: Colors.blue)
      ),
      child: Icon(icon,color: Colors.blue,size: 30,));
  }
}
