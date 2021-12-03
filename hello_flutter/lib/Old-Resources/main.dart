import 'package:flutter/material.dart';

void main() {
  runApp(NavigationApp());
}

class NavigationApp extends StatelessWidget {
  @override
  // Not using `named route`
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: HomeScreen(),
  //   );
  // }

  // Using `named route`
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomeScreen(),
        "/detail": (context) => DetailScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home screen")),
      body: Center(
        child: TextButton(
          child: Text("Move to detail"),
          onPressed: () {
            // Not using `named route`
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) {
            //     return DetailScreen();
            //   }),
            // );

            // Using `named route`
            Navigator.pushNamed(
              context,
              "/detail",
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail screen")),
      body: Center(
        child: TextButton(
          child: Text("Back to Home screen"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//       routes: <String, WidgetBuilder>{
//         "/row": (BuildContext context) => MyStatefulWidget(),
//         "/column": (BuildContext context) => HelloColumn(),
//       },
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _tapCount = 0;

//   @override
//   Widget build(BuildContext context) {
//     print("build");
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Hello AppBar title"),
//       ),
//       body: HelloColumn(),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.ac_unit_rounded),
//         onPressed: didTapCountButton,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         child: Container(
//           height: 50.0,
//         ),
//       ),
//     );
//   }

//   void didTapCountButton() {
//     Navigator.pushNamed(context, "/column");
//     setState(() {
//       _tapCount++;
//     });
//     print(_tapCount);
//   }
// }

// class HelloContainer extends StatelessWidget {
//   const HelloContainer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // constraints: BoxConstraints.expand(
//       //   height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 200.0,
//       // ),
//       margin: EdgeInsets.all(10.0),
//       color: Colors.lightBlueAccent,
//       transform: Matrix4.rotationZ(0.1),
//       alignment: Alignment.topLeft,
//       child: Text(
//         "Hello world",
//         style: Theme.of(context)
//             .textTheme
//             .headline4!
//             .copyWith(color: Colors.white),
//       ),
//     );
//   }
// }

// class HelloRow extends StatelessWidget {
//   const HelloRow({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       textDirection: TextDirection.ltr,
//       children: <Widget>[
//         FlutterLogo(),
//         Expanded(
//           child: const Text(
//             "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.",
//           ),
//         ),
//         Icon(Icons.sentiment_very_satisfied),
//       ],
//     );
//   }
// }

// class HelloColumn extends StatelessWidget {
//   const HelloColumn({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       // mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         const Text('We move under cover and we move as one'),
//         const Text('Through the night, we have one shot to live another day'),
//         const Text('We cannot let a stray gunshot give us away'),
//         const Text('We will fight up close, seize the moment and stay in it'),
//         const Text('It’s either that or meet the business end of a bayonet'),
//         const Text('The code word is ‘Rochambeau,’ dig me?'),
//         Text(
//           'Rochambeau!',
//           style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
//         ),
//       ],
//     );
//   }
// }
