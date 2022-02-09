import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants.dart';
import 'package:flutter_bmi_calculator/widgets/bottom_icons.dart';
import 'package:flutter_bmi_calculator/widgets/reusable.dart';

class ResultPage extends StatelessWidget {
  Constants constants = Constants();
  String bmi;
  String calculateResult;
  String getInterpratition;
  ResultPage(
      {required this.bmi,
      required this.calculateResult,
      required this.getInterpratition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'BMI CALCULATOR',
            style: constants.kTitleTextStyle,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: ReusableCard(
                boxBorder: Border(),
                onPress: () {},
                margin: EdgeInsets.all(30),
                colour: Colors.white,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Your BMI is : ',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      bmi,
                      style: constants.kBMITextStyle,
                    ),
                    Text(calculateResult,
                        style: TextStyle(
                            color: calculateResult == 'Normal'
                                ? Colors.green
                                : Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      calculateResult == 'Normal'
                          ? constants.happyEmoji
                          : constants.sadEmoji,
                      style: TextStyle(fontSize: 32),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCard(
                boxBorder: Border(),
                onPress: () {},
                margin: EdgeInsets.only(left: 30, right: 30),
                colour: Colors.white,
                cardChild: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    getInterpratition,
                    style: constants.kBMIInterpretationStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BottomIcons(
                    icon: Icons.share,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: BottomIcons(
                        icon: Icons.repeat,
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
