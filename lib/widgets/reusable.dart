import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  Color colour;
  final Widget cardChild;
  Function onPress;
  var padding;
  EdgeInsets margin;
  BoxBorder boxBorder;

  ReusableCard(
      {this.colour = Colors.transparent,
      required this.cardChild,
      required this.boxBorder,
      required this.onPress,
      this.padding = EdgeInsets.zero,
      this.margin = const EdgeInsets.all(10)});
      
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        padding: padding,
        child: Center(child: cardChild),
        margin: margin,
        decoration: BoxDecoration(
          border: boxBorder,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.outer,
                blurRadius: 6.0,
                color: Colors.grey,
                offset: Offset(1, 1),
                spreadRadius: 0.0)
          ],
          color: colour,
        ),
      ),
    );
  }
}
