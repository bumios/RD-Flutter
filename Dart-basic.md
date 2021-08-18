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





## 3/ Hàm:

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





## Chưa rõ:

/// - Assert dùng để làm gì