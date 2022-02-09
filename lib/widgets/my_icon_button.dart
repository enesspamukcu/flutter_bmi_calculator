import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  Icon icon;
  Function onPressed;
  MyIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: icon,
      fillColor: Colors.blue,
      shape: CircleBorder(),
    );
  }
}
