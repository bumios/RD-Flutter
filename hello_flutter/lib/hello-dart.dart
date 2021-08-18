// Basic Dart
/// Function `main()`: bắt buộc phải có trong mỗi ứng dụng, nó nằm ở top level, được chạy đầu tiên khi chạy ứng dụng

void main() {
  var levels = Map<Object, Object>();
  levels = {
    // Key:    Value
    "one": "Level 1",
    2.5: "haha",
    "final": ["a", "b", "c"],
    "finalSet": {
      "a": "b",
      "c": "d",
    },
  };
  levels["three"] = "Level 3";

  print("${levels["one"]}");
  print("${levels[2.5]}");
  print("Total: (${levels.length})");

  // print(name);
}
