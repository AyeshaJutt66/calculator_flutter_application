class Calculation {
  double operand1;
  double operand2;
  String operator;

  Calculation({
    required this.operand1,required this.operand2,required this.operator,
  });
  double calculation(){
    double result=0.0;
    switch(operator){
      case "+":
        result = operand1 + operand2;
        break;
      case "-":
        result = operand1 - operand2;
        break;
      case "x":
        result = operand1 * operand2;
        break;
      case "/":
        if(operand2 !=0){
          result = operand1 / operand2;
        }else{result=double.nan;}
        break;
      case "%":
        if(operand2 != 0){
          result = operand1 % operand2;
        }else{result = double.nan;}
        break;
      default:return 0;
    }return result;
  }
}