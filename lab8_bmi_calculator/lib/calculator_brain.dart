import 'dart:math';

class CalculatorBrain {
  final int height; 
  final int weight; 

  double _bmi = 0.0;

  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Thừa cân (Overweight)';
    } else if (_bmi > 18.5) {
      return 'Bình thường (Normal)';
    } else {
      return 'Thiếu cân (Underweight)';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Chỉ số khối cơ thể của bạn cao hơn mức chuẩn. Hãy tăng cường tập thể dục và điều chỉnh chế độ ăn uống nhé!';
    } else if (_bmi >= 18.5) {
      return 'Tuyệt vời! Bạn đang có một chỉ số khối cơ thể hoàn toàn cân đối và khỏe mạnh. Hãy duy trì phong độ này!';
    } else {
      return 'Chỉ số khối cơ thể của bạn thấp hơn mức tiêu chuẩn. Bạn nên bổ sung thêm dinh dưỡng vào các bữa ăn hàng ngày.';
    }
  }
}