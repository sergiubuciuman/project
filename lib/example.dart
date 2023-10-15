class Example {
  double calculateArea(double width, double height,
      {required bool? isTriangle}) {
    double area = 0;
    if (isTriangle != null) {
      area = width * height / 2;
    } else {
      area = width * height;
    }
    return area;
  }
}
