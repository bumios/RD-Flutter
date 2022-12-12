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

Dùng để gom nhiều widget con bên trong nó, có sẵn các tham số custom như padding, margin, borders.



##### Stack

Có thể chứa nhiều widget nhỏ ở trong, nhưng sẽ sắp xếp theo kiểu xếp lớp chồng lên nhau.



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



#### Wrap

Wrap là 1 layout widget tự động sắp xếp các widget nhỏ bên trong, nếu không đủ hiển thị trên cùng 1 hàng thì nó sẽ tự động sắp xếp xuống hàng mới.

```dart
Wrap(
    alignment: WrapAlignment.start,
    spacing: 12,
    children: [
      Chip(
        label: Text('Healthy',
            style: FooderlichTheme.darkTextTheme.bodyText1),
        backgroundColor: Colors.black.withOpacity(0.7),
        onDeleted: () {
          print('delete');
        },
      ),
      Chip(
        label: Text('Vegan',
            style: FooderlichTheme.darkTextTheme.bodyText1),
        backgroundColor: Colors.black.withOpacity(0.7),
        onDeleted: () {
          print('delete');
        },
      ),
      Chip(
        label: Text('Carrots',
            style: FooderlichTheme.darkTextTheme.bodyText1),
        backgroundColor: Colors.black.withOpacity(0.7),
      ),
    ],
  )
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

- Có 2 loại thiết kế hệ thống chính là Material (Android) và Cupertino (iOS), nó hỗ trợ mình build giao diện giống với thiết kế bên native hơn. Nên sử dụng Material vì nó hỗ trợ nhiều thành phần được custom hơn.

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

- ```dart
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

### - Keys:

#### 1. Local Key

Mỗi khi tạo Widget sẽ có 1 Element tương ứng được tạo ra để quản lý cái State & việc rebuild UI của Widget đó. Nhưng nếu là 1 statefull widget, vị trí của Widget thay đổi, thì element nó sẽ ko biết được những element nào bị thay đổi. Vì vậy cần phải thông báo key, giống như tạo định danh riêng cho mỗi widget đó.

```dart
class FavouriteItem extends StatefulWidget {
  // Khai báo thêm key ở constructor
  FavouriteItem({Key key}) : super(key: key);
  
  @override
  _FavouriteItemState createState() {
    return _FavouriteItemState();
  }
}

class HomePageWidget {
  // Lúc khởi tạo các class con, thì khởi tạo ra 1 key và gán nó cho các widget con.
  // UniqueKey() sẽ tự động tạo ra 1 key riêng biệt, không bao giờ bị trùng
  var favouritesWidget = <Widget>[FavouriteItem(key: UniqueKey()), 
                                 FavouriteItem(key: UniqueKey())]
}
```

LocalKey nên được đặt ở widget cấp cao nhất có thể, và bắt buộc các widget phải cùng 1 level trên tree. Từ ví dụ trên, kết quả sẽ khác nếu mình bọc nó vào trong 1 Widget Padding.

```dart
// Hiện tại local key đã được lồng ở bên trong 1 lớp Padding, nên quá trình tìm kiếm widget theo key (matching up widget to elements) sẽ không hoạt động như ví dụ trước đó. 
var favouritesWidget = <Widget>[
  Padding(
    child: FavouriteItem(key: UniqueKey()), 
  ),
  Padding(
		child: FavouriteItem(key: UniqueKey()),
  ),
]
  
// Để giải quyết vấn đề trên, đặt key tại Widget Padding.
var favouritesWidget = <Widget>[
  Padding(
    key: UniqueKey(),
    child: FavouriteItem(), 
  ),
  Padding(
    key: UniqueKey(),
		child: FavouriteItem(),
  ),
]
```

UniqueKey là 1 loại local key, ngoài ra còn có 1 số loại khác như ValueKey và ObjectKey. ValueKey thì nó sẽ so sánh các giá trị của key, còn ObjectKey thì nó sẽ so sánh theo địa chỉ của cái object đó.

** Lưu ý: nếu sử dụng 2 loại key này là lúc định nghĩa giá trị, nếu nó cùng cha, thì bắt buộc giá trị không được trùng nhau.

```dart
// 1 ví dụ không hợp lệ về value key, vì 2 widget padding đang có cùng 1 cha.
var favouritesWidget = <Widget>[
  Padding(
    key: ValueKey("my-favourite-key"),
    child: FavouriteItem(), 
  ),
  Padding(
    key: ValueKey("my-favourite-key"),
		child: FavouriteItem(),
  ),
]

// 1 ví dụ khác, trùng key nhưng hợp lệ vì nó không đứng ngang hàng với nhau
Padding(
  key: ValueKey("my-favourite-key"),
  child: FavouriteItem(key: ValueKey("my-favourite-key")),
)
```



## Key points

### Basic widget

- Three main categories of widgets are: structure and navigation; displaying information; and, positioning widgets.
- There are two main visual design systems available in Flutter, **Material** and **Cupertino**. They help you build apps that look native on Android and iOS, respectively.
- Using the **Material** theme, you can build quite varied user interface elements to give your app a custom look and feel.
- It’s generally a good idea to establish a common theme object for your app, giving you a single source of truth for your app’s style.
- The **Scaffold** widget implements all your basic visual layout structure needs.
- The **Container** widget can be used to group other widgets together.
- The **Stack** widget layers child widgets on top of each other.



### Understanding Widgets

- Flutter maintains three trees in parallel: the `Widget`, `Element` and `RenderObject` trees.
- A Flutter app is performant because it maintains its structure and only updates the widgets that need redrawing.
- The **Flutter Inspector** is a useful tool to debug, experiment with and inspect a widget tree.
- You should always start by creating `StatelessWidget`s and only use `StatefulWidget`s when you need to manage and maintain the state of your widget.
- Inherited widgets are a good solution to access state from the top of the tree.



### Scrollable widgets

- **ListView** and **GridView** support both horizontal and vertical scroll directions.
- The **primary** property lets Flutter know which scroll view is the primary scroll view.
- **physics** in a scroll view lets you change the user scroll interaction.
- Especially in a **nested list view**, remember to set `shrinkWrap` to **true** so you can give the scroll view a fixed height for all the items in the list.
- Use a **FutureBuilder** to wait for an asynchronous task to complete.
- You can nest scrollable widgets. For example, you can place a grid view within a list view. Unleash your wildest imagination!
- Use **ScrollController** and **ScrollNotification** to control or listen to scroll behavior.
- **Barrel** files are handy to group imports together. They also let you import many widgets using a single file.



### Interactive Widgets

- You can pass data around with **callbacks** or **provider packages**.
- If you need to pass data one level up, use **callbacks**.
- If you need to pass data deep in the widget tree, use **providers**.
- **Provider** is a state management helper that acts as a wrapper around inherited widgets.
- **Provider** helps expose state model objects to widgets below it.
- `Consumer` listens for changes to values and rebuilds the widgets below itself.
- Split your widgets by screen to keep code modular and organized.
- Create `manager` objects to manage functions and state changes in one place.
- Gesture widgets recognize and determine the type of touch event. They provide callbacks to react to events like `onTap` or `onDrag`.
- You can use dismissible widgets to swipe away items in a list.



### Routes & Navigation

- You can wrap another router in a **containing widget**.
- **Navigator 1.0** is useful for quick and simple prototypes, presenting alerts and dialogs.
- **Navigator 2.0** is useful when you need more control and organization when managing the navigation stack.
- In Navigator 2.0, the navigator widget holds a list of `MaterialPage` objects.
- Use a **router widget** to listen to navigation state changes and configure your navigator’s list of pages.
- Setting the router’s **Back** button dispatcher lets you listen to platform system events.



### Shared Preferences

- There are multiple ways to save data in an app: to files, in shared preferences and to a SQLite database.
- Shared preferences are best used to store simple, key-value pairs of primitive types like strings, numbers and Booleans.
- An example of when to use shared preferences is to save the tab a user is viewing, so the next time the user starts the app, they’re brought to the same tab.
- The `async`/`await` keyword pair let you run asynchronous code off the main UI thread and then wait for the response. An example is getting an instance of `SharedPreferences`.
- The shared_preferences plugin should not be used to hold sensitive data. Instead, consider using the **flutter_secure_storage** plugin.



### Serialization With JSON

- JSON is an open-standard format used on the web and in mobile clients, especially with REST APIs.
- In mobile apps, JSON code is usually parsed into the model objects that your app will work with.
- You can write JSON parsing code yourself, but it’s usually easier to let a JSON package generate the parsing code for you.
- **json_annotation** and **json_serializable** are packages that will let you generate the parsing code.



### Networking in Flutter

- The **HTTP** package is a simple-to-use set of methods for retrieving data from the internet.
- The built-in `json.decode` transforms JSON strings into a map of objects that you can use in your code.
- `FutureBuilder` is a widget that retrieves information from a `Future`.
- `GridView` is useful for displaying columns of data.



### Usign the "Chopper" Library

- The **Chopper** package provides easy ways to retrieve data from the internet.
- You can add headers to each network request.
- Interceptors can intercept both requests and responses and change those values.
- Converters can modify requests and responses.
- It’s easy to set up global logging.



### Others

- Build a new app with `flutter create`.
- Use widgets to compose a screen with controls and layout.
- Use widget parameters for styling.
- A `MaterialApp` widget specifies the app, and `Scaffold` specifies the high-level structure of a given screen.
- State allows for interactive widgets.
- When state changes, you usually need to hot restart the app instead of hot reload. In some case, you may also need to rebuild and restart the app entirely.
