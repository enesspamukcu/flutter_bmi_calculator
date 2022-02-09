class Calculator{
  final int weight;
  final int height;
  late double bmi;
  Calculator({required this.weight,required this.height});
  
  String calculateBMI(){
    bmi = weight/((height/100)*(height/100));
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(bmi>=25){
      return 'Overweight';
    }else if(bmi>=18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
 String getInterpretation(){
     if(bmi>=25){
      return 'You have a higher than normal body weight.Try to exercise more';
    }else if(bmi>=18.5){
      return 'You have normal body weight.Good job.';
    }else{
      return 'You have a lower than normal body weight.You can eat a bit more.';
    }
 }
}