# Flutter notes

---

## Navigation:

- Navigator là 1 widget quản lý theo kiểu ngăn xếp (stack) các đối tượng Route.
- Route là 1 object được quản lý bởi Navigator dùng để present màn hình. VD: MaterialPageRoute
  - Route có thể được đặt tên riêng, được định nghĩa ở tham số **routes** trong MaterialApp hoặc CupertinoApp
  - **MaterialPageRoute:** Sử dụng để khởi tạo 1 route mới, và hiệu ứng lúc chuyển đổi màn hình thì nó phụ thuộc vào hệ điều hành đang của máy đang chạy.
  - **Push & Pop:**
    - Sử dụng phương thức push() để đẩy màn hình, đồng nghĩa với việc thêm 1 route vào trong stack được quản lý bởi Navigator.
  - Sử dụng pop() để trở về màn hình trước, nó sẽ loại bỏ (remove) route ra khỏi stack từ Navigator.
    - Push bằng tên của route: (**named routes**)
    - Khởi tạo bên trong widget **MaterialApp**, khai báo màn hình gốc tại tham số **initialRoute**, và các route được define tại tham số **routes**. Khi push sử dụng phương thức **Navigator.pushNamed()**.
      - Truyền & đọc tham số cho routes:
      - C1 - Extracts arguments: 
          - Khai báo routes tại tham số **routes** ở màn hình gốc. (MyApp)
        - Truyền dữ liệu qua đối số **arguments** của func **Navigator.pushNamed()**. (màn hình cha)
          - Để đọc giá trị sử dụng **ModalRoute.of()** bên trong thân hàm `Widget build` màn hình con. 
      - C2 - Passing arguments:
          - Khai báo các biến có thể truyền dữ liệu bên trong class con.
        - Sử dụng hàm **onGenerateRoute()** ở màn hình gốc và điều hướng việc gán dữ liệu.
          - Truyền dữ liệu qua đối số **arguments** của func **Navigator.pushNamed()**. (màn hình cha)
        - Sử dụng biến đã khởi tạo để lấy dữ liệu.



## Widgets:

#### Expanded:

Chứa view con bên trong, tự động được co giãn.



#### Scaffold:

Là 1 widget đã phân chia sẵn các phần component của layout ra như appBar, body, …ActionButton, snack bars, bottom sheets, …



#### Standard

##### Container:

Có thể custom các thuộc tính bên trong nó như padding, margin, borders.



##### GridView:

Sắp xếp cái widgets theo dạng lưới.



##### ListView:

Sắp xếp cái widgets theo dạng danh sách (List).



#### Center:

Dùng để đưa cái child widget ra giữa của chính nó.



#### Row, Column:

- Sắp xếp các Widget con theo kiểu ngang (Horizontal) hoặc dọc (Vertical).

- Là 1 low-level-widgets.

- Higher-level-widgets của Row là ListTile, Column là ListView.



#### Snack Bar

Hiển thị 1 view giống như thông báo nhưng chạy từ dưới lên trên. (Từ scaffold widget)

```dart
final snackBar = SnackBar(content: Text("Heo con ăn cám !!!"));
ScaffoldMessenger.of(context).showSnackBar(snackBar);
```



#### Inherited Widget

Widget này sẽ chứa các data được sử dụng chung của 1 màn hình, nó tương tự như ThemeData.

```dart
class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: MyHomeInheritedWidget(child: HomeScreen(), tapCount: count),		// khởi tạo Inherited Widget
      floatingActionButton: TextButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text("Increase count")),
    ));
  }
}

class MyHomeInheritedWidget extends InheritedWidget {
  MyHomeInheritedWidget({required Widget child, required this.tapCount})
      : super(child: child);

  final int tapCount;

  // [!] Hàm bắt buộc phải định nghĩa  
  @override
  bool updateShouldNotify(MyHomeInheritedWidget oldWidget) {
    print("[debug] MyHomeInheritedWidget ${tapCount != oldWidget.tapCount}");
    // Điều kiện để rebuild các Widget con, return false thì sẽ ko rebuild
    return tapCount != oldWidget.tapCount;
  }

  // [!] Hàm bắt buộc phải định nghĩa
  static MyHomeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyHomeInheritedWidget>();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lấy giá trị của biến thông qua `static func of()` truyền vào 1 context
    print("[debug] HomeScreen ${MyHomeInheritedWidget.of(context)!.tapCount}");
    return Scaffold(
      // Khởi tạo widget con
      body: SafeArea(child: HomeContentWidget()),
    );
  }
}

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        "[debug] Rebuild HomeContentWidget ${MyHomeInheritedWidget.of(context)!.tapCount}");
    return Center(
      child: Column(
        children: [
          Text(
            "Tapped: ${MyHomeInheritedWidget.of(context)!.tapCount} times",
            style: TextStyle(color: Colors.orangeAccent),
          ),
          // Khởi tạo thêm 1 lớp widget con nữa
          ContentChildWidget()
        ],
      ),
    );
  }
}

class ContentChildWidget extends StatelessWidget {
  const ContentChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Cách lấy dữ liệu ra tương tự như nhau
    print(
        "[debug] Rebuild ContentChildWidget ${MyHomeInheritedWidget.of(context)!.tapCount}");
    return Text(
      "Tapped: ${MyHomeInheritedWidget.of(context)!.tapCount} times",
      style: TextStyle(color: Colors.lightBlueAccent),
    );
  }
}
```





## Layout

- **child** & **children** arguments:
  - Thuộc tính **child** dùng để khai báo 1 widget con đơn lẻ.
  - Thuộc tính **children** để mô tả nó có thể có nhiều widgets con.



## Others: 

- Mọi view đều được gọi là **Widget**.

- Hàm **main()** là nơi mà code sẽ được thực thi đầu tiên.

- 1 ứng dụng cơ bản thì đầu tiên nó sẽ chạy vào function **runApp()**.

- **Stateless** (Hiểu đơn giản là không có state), nó không chủ động được việc update UI của nó, mà sẽ bị ép bởi class cha.

- **Stateful** (Có state) class tạo ra 1 instance của 1 class State, class State này sẽ tồn tại trong suốt thời gian tồn tại của widget.

- **Hotkey** để khởi tạo sẵn code cần thiết của 2 class Stateless & Stateful: **stless** & **stful**
  
  - Hàm **createState()** nó có ý nghĩa là khi Widget được khởi tạo, thì sẽ có 1 **State** được tạo ra và gắn kèm với nó.
  - Hàm **setState()** dùng để thay đổi giá trị các biến State, hàm **build()** của Widget sẽ được gọi ngay sau đó để reload lại UI.
  - Hàm build nó sẽ vẽ lại widget của chính nó, và toàn bộ sub-widgets của nó luôn.
  
- Mọi data của **Stateless** và **Stateful** bắt buộc phải là **immutable** (không được truy cập hoặc thay đổi trực tiếp từ class khác), nên phải khai báo từ khóa **final**.

- Việc lưu trữ biến:

  - Flutter hoạt động theo kiểu "Single-responsibility principle", nghĩa là "mỗi class mỗi trách nhiệm riêng".

    - Vì vậy ở state full widget thì những giá trị cố định, ko thể thay đổi thì sẽ được định nghĩa tại class Widget, những giá trị có thể thay đổi đến UI thì sẽ được lưu trữ tại class State.

    - Bên trong class State có thể truy cập tới giá trị của class Widget thông qua biến **widget**

    - ```dart
      class LoginScreen extends StatefulWidget {
        final int bienCuaTui = 1;
      }
      
      class _LoginScreenState extends State<LoginScreen> {
        @override
        Widget build(BuildContext context) {
          return Text("${widget.bienCuaTui}");
        }
      }
      ```

- Lệnh chạy generate app icon:

- ```shell
  flutter pub run flutter_launcher_icons:main
  ```

- Theme

  Trong này chứa các style được định nghĩa để xài chung, từ class lớn đi đến các lớp nhỏ có thể kế thừa xài lại được.

  ```dart
  // Khai báo tạo class cha
  MaterialApp(
    theme: ThemeData(
  		primaryColor: Colors.lightGreen,		// Màu lightGreen sẽ được gán cho thuộc tính primaryColor
    )
  )
    
  // Sử dụng tại class con
  Theme.of(context).primaryColor					// Lấy ra giá trị của primaryColor từ Theme của cha
  ```

  

- Life cycle, hàm dispose và initState.

- ```
  @override
    void dispose() {
      // The widget is removed from the widget tree
      super.dispose();
    }
  
    @override
    void initState() {
      super.initState();
    }
  ```

- 
