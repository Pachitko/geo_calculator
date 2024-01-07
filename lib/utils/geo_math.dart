import "dart:math";

void main() {}

class GeoMath {
  static double _toRad([double deg = 180.0]) {
    double rad = deg * pi / 180;
    return rad;
  }

  static double toDeg([double degree = 0, double min = 0, double sec = 0]) {
    double deg = degree + min / 60 + sec / 3600;
    return deg;
  }

  static String toGMS([double deg = 0]) {
    int degree = deg.toInt();
    double min = ((deg - deg.toInt()) * 60);
    double sec = double.parse(((min - min.toInt()) * 60).toStringAsFixed(2));
    return "${degree.toString()}° ${min.toInt().toString()}′ ${sec.toString()}′′";
  }

  static (double, double) directGeo(
      [double xA = 0,
      double yA = 0,
      double horLine = 0,
      double degree = 0,
      double min = 0,
      double sec = 0]) {
    double deg = _toRad(toDeg(degree, min, sec));

    double deltaX = horLine * cos(deg);
    double deltaY = horLine * sin(deg);

    double resultX = xA + deltaX;
    double resultY = yA + deltaY;

    return (resultX, resultY);
  }

  static (double, double, double) reverseGeo(
      [double xA = 0, double yA = 0, double xB = 0, double yB = 0]) {
    double deltaX = xB - xA;
    double deltaY = yB - yA;

    double resultDegree = atan((deltaY / deltaX));

    double horLine1 = (deltaX / cos(resultDegree)).abs();
    double horLine2 = (deltaY / sin(resultDegree)).abs();
    double horLine3 = sqrt(deltaX * deltaX + deltaY * deltaY);

    return (horLine1, horLine2, horLine3);
  }

  static String formatDouble([double digit = 0]) {
    return digit.toStringAsFixed(2);
  }
}
