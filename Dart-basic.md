# Dart basic

-----

## 1/ Khai báo biến:

### 1.1/ Var

**Không cần khai báo kiểu giá trị, kiểu giá trị của nó phụ thuộc vào giá trị khởi tạo.**

```dart
var number = 27;					// int
var string = "Bumios";		// String
```



### 1.2/ Final

**Đối tượng này sẽ không được thay đổi, nhưng nếu là 1 mảng, giá trị bên trong nó vẫn có thể thay đổi**

```dart
// Final String
final String name = "Bumios";
name = "XXX";										// Lỗi compile

// Final Array
final numbers = [1, 2, 3];
numbers = [4, 5, 6];						// Lỗi compile
numbers.add(4); 								// -> numbers = [1, 2, 3, 4]
```



### 1.3/ Constant

**Tương tự như final, nhưng không thể thay đổi giá trị bên trong nó**

```dart
// Khai báo từ khóa const trước tên biến
const String name = "Bumios";
// Khai báo const cho giá trị của biến (Chỉ áp dụng với kiểu dữ liệu List & Set)
List<String> names = const ["Bumios"];

const numbers = [1, 2, 3];
numbers = [4, 5, 6];						// Lỗi compile
numbers.add(4); 								// Không lỗi compile nhưng gây crash chương trình
```



### 1.4/ Late

**Giống như lazy của swift, biến sẽ được khởi tạo khi giá trị của nó được gán**

```dart
late String name;
print(name);							// Compile sẽ báo lỗi

name = "Bumios";					// Gán giá trị, biến đã được khởi tạo
name = "Nhật Duy";				// Thay đổi giá trị
print(name);							// In ra -> "Nhật Duy"
```





## 2/ Kiểu dữ liệu:

###  2.1/ Number (Integer or Double)

**1 kiểu số nào đó, có thể là `int` hoặc `double`**

```dart
num number = 1;					// Chưa xác định (có thể là int: 1, hoặc double: 1.0)
number = 1 + 2;					// int
number = number + 0.5;	// double
```



### 2.2/ Strings

**Chuỗi được thể hiện bằng ký tự dấu nháy đơn `'` hoặc dấu nháy kép `""`**

```dart
// Cùng in 1 text "What's your name ?" theo 2 cách
var singleQuotes = 'What\'s your name ?';
String doubleQuotes = "What's your name ?"; 

// Truyền 1 biến vào chuỗi và biến đổi giá trị của biến đó, dùng dấu ngoặc nhọn `{expression}`
var name = "Bumios";
final outputText = "Hello, user ${name.toUpperCase()}"; 		// -> "Hello, user BUMIOS"
```



### 2.3/ Booleans

**Định nghĩa bằng tiền tố bool trước tên biến**

```dart
// Khai báo cơ bản
bool isMale = true;

// Khai báo từ giá trị của biến khác
String name = "Bumios";
var isValidName = name.isNotEmpty;
```



### 2.4/ List

**Mảng (Array) được khai báo thông qua từ khóa var hoặc List<<GenericType>>**

```dart
List<int> numbers = [1, 2, 3];									// Khai báo 1 mảng int
List<String> values = ["x", "y", "z"];					// Khai báo 1 mảng String

// Nối giá trị của mảng bằng spread operator ... hoặc ...?
var unsafeNumbers = [0, ...numbers];						// Giống với: [0] + numbers

/// Lưu ý: nếu mảng numbers có thể null hoặc chưa khởi tạo, thì nên dùng ...? để tránh gây crash chương trình.
var canBeNullNumbers;
var safeNumbers = [0, ...canBeNullNumbers];			// Crash chương trình
var safeNumbers = [0, ...?canBeNullNumbers];		// [0]
```



#### 2.4.1/ Collection if

**Thêm item vào mảng dựa vào điều kiện if ở bên trong nó**

```dart
bool isContainFlutter = true;
var names = [
  "iOS",
  "Android",
  // Nếu điều kiện == true thì names sẽ có thêm item "Flutter"
  if (isContainFlutter) "Flutter",		
];
```



#### 2.4.2/ Collection for

**Thêm item vào mảng bằng vòng for của 1 mảng khác**

```dart
var levels = [2, 3];

var levelsString = [
  "Level 1",
  for (var level in levels) "Level $level",
  "Level final"
];
// Giá trị của levelsString -> [Level 1, Level 2, Level 3, Level final]
```



### 2.5/ Sets

**Tập hợp Set tương tự như 1 mảng, nhưng giá trị của các phần tử là duy nhất, không bị trùng lặp với nhau.**
**Sets cũng hỗ trợ các spread operators hoặc collection if / for**

```dart
// Khai báo 1 tập hợp Set
var levelsSet = {1, 2, 3, 4, 5};
Set<int> levelsSet2 = {1, 2, 3, 4, 5};

levelsSet.add(6);				// {1, 2, 3, 4, 5, 6}
levelsSet.add(1);				// Giá trị 1 đã có trước đó nên nó sẽ ko được thêm vào mảng nữa
```



### 2.6/ Maps

**Là 1 tập hợp gồm key và value, key là giá trị bất kỳ và duy nhất, có thể là kiểu Number hoặc String (Cùng 1 đối tượng map nhưng Key không nhất thiết phải cùng kiểu dữ liệu).**
**Maps cũng hỗ trợ các spread operators hoặc collection if / for****

```dart
// Khai báo
// - Cách 1: Xác định ngay từ đầu kiểu dữ liệu của key và value
var levels = Map<String, String>();

// - Cách 2: Key ở đây có thể là chuỗi, hoặc số (int hoặc double) đều được
// - Tương đương với cách khai báo Map<Object, Object>
var levels = {
  // Key:    Value
  "one": 	"Level 1",
  2: "Level 2",
  2.5: "Level 2.5",
};

// Ghi giá trị
levels[3] = "Level 3";					// Chỉ chạy nếu khai báo theo cách 2
levels["three"] = "Level 3";		// Cả 2 cách đều sử dụng được vì trùng kiểu dữ liệu

// Đọc giá trị
levels["one"];									// -> "Level 1"
levels[2];											// -> "Level 2" theo cách 1, và null theo cách 2
levels["not-defined-yet"];			// -> null

// Đếm số lượng phần tử bên trong tập hợp Map
print(levels.length)
```





## 3/ Hàm (functions)

### 3.1/ Khai báo cơ bản:

**Ý nghĩa function bên dưới:**

* `void`: Giá trị trả về của hàm, nếu không có thì sẽ để `void` hoặc để trống (dynamic).
* `sendMessage`: Tên hàm. **(Bắt buộc có)**

* `String`: Kiểu dữ liệu của tham số. (Nếu không khai báo thì sẽ mặc định hiểu là dynamic)

* `sender`, `message`: Tên tham số, phạm vi sử dụng ở bên trong thân hàm. (Không phải tên đối số khi gọi function)

```dart
void sendMessage(String sender, String message) {
  print("$sender said: $message");
}

// Gọi hàm
sendMessage("Bumios", "Welcome to my blog.")			// "Bumios said: Welcome to my blog."
```



### 3.2/ Shorthand syntax (`=>`)

**Nếu 1 hàm mà chỉ có 1 dòng mã xử lý bên trong, thì chúng ta có thể áp dụng shorthand syntax thông qua ký tự `=>`.**

```dart
// Áp dụng shorthand syntax từ ví dụ trên
sendMessage(String sender, String message) => print("$sender said: $message");
```



### 3.3/ Parameters

#### 3.3.1/ Đặt tên cho tham số:

**Từ phần tạo 1 function cơ bản, để có thể dùng tên tham số khi truyền vào, bọc toàn bộ tham số vào trong dấu ngoặc kép.**

```dart
void sendMessage({ String? sender, String? message }) => print("$sender said: $message");

sendMessage(sender: "Bumios", message: "Welcome to my blog.");
// -> "Bumios said: Welcome to my blog."

// Chỉ truyền 1 tham số sender
sendMessage(sender: "Bumios");
// -> "Bumios said: null"
```



#### 3.3.2/ Required & Default value:

**Từ khóa `Required` bắt buộc dùng khi thỏa mãn cả 2 điều kiện dưới: **

- **Kiểu dữ liệu của tham số không phải optional.**
- **Chưa được set giá trị mặc định.**

```dart
// Lỗi: sender và message không phải optional, và chưa được set default
void sendMessage({ String sender, String message }) { }
```



**Để giải quyết vấn đề trên, có 2 cách:**

```dart
// - Cách 1: Thiết lập giá trị default cho tham số
void sendMessage({ String sender = "Unknown", String message = "No message." }) { }

// - Cách 2: Thêm từ khóa required
void sendMessage({ required String sender, required String message }) { }
```

**Notes:** Tham số nào được gắn với từ khóa `required`, đối số của nó sẽ tự động được tạo ra lúc gọi hàm.



### 3.4/ Functions as first-class objects

**Từ bên trong 1 callback và gọi đến 1 hàm khác mà không cần khai báo đối số của hàm**
**Điều kiện để áp dụng, 2 vế bên dưới phải giống nhau.**

* **Số lượng phần tử và kiểu dữ liệu được trả về trong closure. (Trong ví dụ là hàm `forEach` trả về 1 `int`)**

* **Kiểu dữ liệu các tham số của hàm. (Hàm `increaseAndPrint` có 1 tham số là `int`)**

```dart
// Ví dụ: Lặp từng số trong mảng, và in ra giá trị của nó + thêm 1
// - Ta có 1 mảng số
final numbers = [0, 1, 2, 3, 4, 5];

// - Tạo 1 function xử lý tăng và in giá trị
void increaseAndPrint(int number) {
  number++;
  print(number);
}
```

Theo cách thông thường

```dart
numbers.forEach((element) {
	increaseAndPrint(element);
});
```

Dùng theo kiểu first class function

```dart
numbers.forEach(increaseAndPrint);
```





## 4/ Toán tử (Operators)

### 4.1/ Arithmetic (Số học)

**Độ ưu tiên của toán tử**

**Chú ý tới ký tự ++ hoặc -- nằm trước hoặc sau biến**

```dart
// Được ưu tiên Tính toán trước khi gán giá trị
++var		// (cộng thêm 1)
--var		// (trừ đi 1)

// Gán giá trị xong mới bắt đầu tính toán
var++		// (cộng thêm 1)
var--		// (trừ đi 1)
```

Giải thích cơ bản:

```dart
int a;
int b;

// ++var
a = 0;
b = ++a; 		// Biến a sẽ được tăng trước (0 lên 1), sau đó kết quả 1 đó sẽ được gán cho biến b
// b = 1, a = 1

// ++var
a = 0;
b = a++; 		// Gán giá trị a (đang là 0) cho biến b, rồi mới xử tăng biến a 
// Lúc này thì b = 0, và a = 1

// Tương tự với ký hiệu --
```



### 4.2/ Equality and relational [PENDING - Low]

### 4.3/ Type test

**Ép kiểu đối tượng cho 1 biến sử dụng toán tử `as` (Typecast), cách này không an toàn.**

```dart
class People {}

class EmployeeManager extends People {
  void adjustSalary() { }
}

class Developer extends People {}

final People someone;
// Ép kiểu biến someone sử dụng toán tử as, có thể throw ra 1 exception
(someone as EmployeeManager).adjustSalary();
```

**Kiểm tra kiểu của đối tượng sử dụng toán tử `is`**

```dart
if (someone is Developer) {
  print("This is a developer");
} else if (someone is EmployeeManager) {
  print("This is a manager");
  // Trong block code của `is`, thì có thể sử dụng được các phương thức của đối tượng đó
  someone.adjustSalary();
} else {
  print("Someone else");
}
```



### 4.4/ Assignment [PENDING - Low]

### 4.5/ Logical [PENDING - Low]

### 4.6/ Conditional expressions [PENDING]

### 4.7/ Cascade notation [PENDING]





## 5/ Control flow statements

### 5.1/ If, else if, else

**Câu lệnh điều kiện if, else if được bao quanh bởi dấu ngoặc tròn**

```dart
if (isRaining()) {
  print("The weather is raining.")
} else if (isSnowing()) {
  print("The weather is snowing.")
} else {
	print("The weather is boring.")
}
```



### 5.2/ For loops

**Duyệt từng phần tử trong mảng, có 2 cách để duyệt từng phần tử trong vòng lặp `for`****

```dart
// Khai báo 1 mảng các ký tự kiểu chuỗi
final strings = ["N", "A", "M", "E", "S"];

/// - Cách 1: Tự xử lý giới hạn phần tử được duyệt
for (var index = 0; index < strings.length; index++) {
	print("Value: ${strings[index]} (index: $index)");
}

/// - Cách 2: Vòng lặp for-in, không cần biết giá trị thứ tự của phần tử
for (var string in strings) {
	print(string);
}
```



### 5.3/ While and do-while  [PENDING - Low]

### 5.4/ break and continue  [PENDING]

### 5.5/ Switch case  [PENDING]





## 6/ Exceptions

### 6.1/ Throw [PENDING]

### 6.2/ Catch [PENDING]

### 6.3/ Finally [PENDING]





## Quick note:

### 1/ Class init, get set variable.

```dart
class MyRectangle {
  double left, right, top, bottom, width, height;

  // Init function
  MyRectangle(
      this.left, this.right, this.top, this.bottom, this.width, this.height);
	
  // Get set
  double get totalWidth => left + width + right;
  set totalWidth(double value) {
    width = value - left - right;
    left = 20;
  }
}
```

### 2/ Abstract methods (Giống như protocol trong swift)

```dart
abstract class ViewModel {
  int numberOfItems();
}

class MyViewModel extends ViewModel {
  int numberOfItems() {
    return 10;
  }
}
```

### 3/ Abstract methods (Giống như protocol trong swift)

```dart
class BaseController {
  void viewDidLoad() {
    print("viewDidLoad called from BaseController");
  }
}

class LoginViewController extends BaseController {
  
  // Dùng từ khóa @override để chú thích rằng function này đang được ghi đề từ base, ko có vẫn chạy bt.
  @override
  void viewDidLoad() {
    // Gọi super nếu muốn thực thi code từ base class (BaseController)
    super.viewDidLoad();
    print("viewDidLoad called from LoginViewController");
  }
}
```

### 4/ Enum

```dart
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

/// Sử dụng biến .values từ enum để lấy ra 1 List<> toàn bộ case của nó
List<MyColor> colors = MyColor.values;
print(colors[0] == MyColor.lightBlue);

/// Sử dụng .index để in ra số thứ tự (index) của case
print(MyColor.lightBlue.index);
print(MyColor.lightGreen.index);
```



