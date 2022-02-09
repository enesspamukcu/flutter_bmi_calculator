import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  //Function onTap;
  String title;
  BottomButton({required this.title});
  final Constants constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: constants.bottomContainerColor,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 24),
      )),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: constants.bottomContainerHeight,
    );
  }
}
