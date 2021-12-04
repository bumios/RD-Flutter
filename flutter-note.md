# Flutter notes

---

## Navigation:

- - Navigator là 1 widget quản lý theo kiểu ngăn xếp (stack) các đối tượng Route.

  - Route là 1 object được quản lý bởi Navigator dùng để present màn hình. VD: MaterialPageRoute

  - - Route có thể được đặt tên riêng, được định nghĩa ở tham số **routes** trong MaterialApp hoặc CupertinoApp
    - **MaterialPageRoute:** Sử dụng để khởi tạo 1 route mới, và hiệu ứng lúc chuyển đổi màn hình thì nó phụ thuộc vào hệ điều hành đang của máy đang chạy.

  - **Push & Pop:**

  - - - Sử dụng phương thức push() để đẩy màn hình, đồng nghĩa với việc thêm 1 route vào trong stack được quản lý bởi Navigator.

    - Sử dụng pop() để trở về màn hình trước, nó sẽ loại bỏ (remove) route ra khỏi stack từ Navigator.

    - Push bằng tên của route: (**named routes**)

    - - Khởi tạo bên trong widget **MaterialApp**, khai báo màn hình gốc tại tham số **initialRoute**, và các route được define tại tham số **routes**. Khi push sử dụng phương thức **Navigator.pushNamed()**.

      - Truyền & đọc tham số cho routes:

      - - C1 - Extracts arguments: 

        - - Khai báo routes tại tham số **routes** ở màn hình gốc. (MyApp)
          - Truyền dữ liệu qua đối số **arguments** của func **Navigator.pushNamed()**. (màn hình cha)
          - Để đọc giá trị sử dụng **ModalRoute.of()** bên trong thân hàm `Widget build` màn hình con. 

        - C2 - Passing arguments:

        - - Khai báo các biến có thể truyền dữ liệu bên trong class con.
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





## Layout

- **child** & **children** arguments:
  - Thuộc tính **child** dùng để khai báo 1 widget con đơn lẻ.
  - Thuộc tính **children** để mô tả nó có thể có nhiều widgets con.



## Others: 

- Mọi view đều được gọi là **Widget**.

- Hàm **main()** là nơi mà code sẽ được thực thi đầu tiên.

- 1 ứng dụng cơ bản thì đầu tiên nó sẽ chạy vào function **runApp()**.

- **Stateless** (Hiểu đơn giản là không có state) class thuộc loại không thể thay đổi (immutable)

- **Stateful** (Có state) class tạo ra 1 instance của 1 class State, class State này sẽ tồn tại trong suốt thời gian tồn tại của widget.

- - **Hotkey** để khởi tạo sẵn code cần thiết của 2 class Stateless & Stateful: **stless** & **stful**
  - Hàm **createState()** nó có ý nghĩa là khi Widget được khởi tạo, thì sẽ có 1 **State** được tạo ra và gắn kèm với nó.
  - Hàm **setState()** dùng để thay đổi giá trị các biến State, hàm **build()** của Widget sẽ được gọi ngay sau đó để reload lại UI.
  - Hàm build nó sẽ vẽ lại widget của chính nó, và toàn bộ sub-widgets của nó luôn.

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

- 

- 