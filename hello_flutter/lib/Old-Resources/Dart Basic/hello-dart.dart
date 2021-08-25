// Basic Dart

/// Function `main()`: bắt buộc phải có trong mỗi ứng dụng, nó nằm ở top level, được chạy đầu tiên khi chạy ứng dụng

void main() {
  List<MyColor> colors = MyColor.values;
  print(colors[0] == MyColor.lightBlue);

  print(MyColor.lightBlue.index);
  print(MyColor.lightGreen.index);
}

enum MyColor { lightBlue, lightGreen }

void printColor(MyColor color) {
  switch (color) {
    case MyColor.lightBlue:
      print("lightBlue");
      break;
    case MyColor.lightGreen:
      print("lightGreen");
      break;
  }
}
