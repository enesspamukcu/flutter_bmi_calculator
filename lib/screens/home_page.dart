import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmi_calculator/constants.dart';
import 'package:flutter_bmi_calculator/screens/result.page.dart';
import 'package:flutter_bmi_calculator/widgets/bottom_button.dart';
import 'package:flutter_bmi_calculator/widgets/my_icon_button.dart';
import 'package:flutter_bmi_calculator/widgets/reusable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weight_slider/weight_slider.dart';

import '../calculator.dart';

enum GenderType { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenderType? selectedGender;
  Constants constants = Constants();
  int height = 120;
  int weight = 60;
  int age = 20;
  Border selectActiveCard = Border.all(width: 3.0, color: Colors.blue);
  Border selectInactiveCard = Border.all(width: 0.0, color: Colors.white);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: constants.kTitleTextStyle,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      boxBorder: Border(),
                      onPress: () {},
                      padding: EdgeInsets.all(8),
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: constants.kLabelTextStyle),
                            SizedBox(
                              height: 10,
                            ),
                            WeightSlider(
                                weight: weight,
                                minWeight: 40,
                                maxWeight: 140,
                                onChange: (value) => setState(
                                      () => weight = value,
                                    ))
                          ]),
                      colour: constants.kActiveCardColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      boxBorder: Border(),
                      onPress: () {},
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: constants.kLabelTextStyle),
                          Text(age.toString(),
                              style: constants.kNumberTextStyle),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyIconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icon(FontAwesomeIcons.minus),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyIconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icon(FontAwesomeIcons.plus),
                              )
                            ],
                          )
                        ],
                      ),
                      colour: constants.kActiveCardColour,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                boxBorder: Border(),
                onPress: () {},
                colour: constants.kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: constants.kLabelTextStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: constants.kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: constants.kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          overlayColor: Colors.indigo.shade50,
                          thumbColor: Colors.blue,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.blue,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          min: 120,
                          max: 220,
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      padding: EdgeInsets.all(24),
                      boxBorder: selectedGender == GenderType.male
                          ? selectActiveCard
                          : selectInactiveCard,
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      cardChild: Image.asset('images/man.png'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      padding: EdgeInsets.all(24),
                      boxBorder: selectedGender == GenderType.female
                          ? selectActiveCard
                          : selectInactiveCard,
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      colour: Colors.white,
                      cardChild: Image.asset('images/woman.png'),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Calculator calculator =
                    Calculator(weight: weight, height: height);
                String bmi = calculator.calculateBMI();
                String result = calculator.getResult();
                String interpretation = calculator.getInterpretation();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmi: bmi,
                        calculateResult: result,
                        getInterpratition: interpretation,
                      ),
                    ));
              },
              child: BottomButton(
                title: 'CALCULATE',
              ),
            ),
          ],
        ));
  }
}
