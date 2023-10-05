import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Learn Flutter'),

      // widget Text
      // home: Text('Hello, world!'),

      // widget Image
      // home: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),

      // widget Cupertino
      // home: Container(
      //   margin: const EdgeInsets.only(top:30),
      //   color: Colors.white,
      //   child:Column(
      //     children:<Widget>[
      //       AppBar(title: const Text('Cupertino'), backgroundColor: Colors.blue),
      //       CupertinoButton(child: Text('Cupertino Button'), onPressed: (){print('Cupertino Button');}),
      //       CupertinoActivityIndicator(),
      //     ]
      //   )
      // ),

      // widget button
      // home: Scaffold(
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       print('Floating Action Button');
      //     },
      //     child: const Icon(Icons.thumb_up),
      //     backgroundColor: Colors.pinkAccent,
      //   ),
      // ),

      // widget scaffold
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Scaffold'),
      //     backgroundColor: Colors.blue,
      //
      //   ),
      //   body: const Center(
      //     child: Text('Scaffold'),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       print('Floating Action Button');
      //     },
      //     child: const Icon(Icons.thumb_up),
      //     backgroundColor: Colors.pinkAccent,
      //   ),
      // )

      // widget scaffold 2
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Scaffold'),
      //     backgroundColor: Colors.blue
      //   ),
      //   body: const Center(
      //     child: Text('My name is Muhammad Hatta and call me Hatta'),
      //   ),
      //   bottomNavigationBar: BottomAppBar(
      //     child: Container(
      //       height: 50.0,
      //     ),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       print('Floating Action Button');
      //     },
      //     child: const Icon(Icons.add),
      //     backgroundColor: Colors.blue,
      //   ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // )

      // widget input
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Contoh TextField'),
      //     backgroundColor: Colors.blue,
      //   ),
      //   body: TextField(
      //     decoration: const InputDecoration(
      //       border: OutlineInputBorder(),
      //       labelText: 'Nama Lengkap',
      //     )
      //   ),
      // ),

      // widget container
      // home: Scaffold(
      //     appBar: AppBar(title: Text("Contoh Button")),
      //     body: Container(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             print("Button Pressed");
      //           },
      //           style: ButtonStyle(
      //             foregroundColor: MaterialStateProperty.all<Color>(Colors.red), // Text color
      //           ),
      //           child: Text(
      //               "Button",
      //               style: TextStyle(fontSize: 20)
      //           ),
      //         )
      //     )
      // ),

      //widget layout
      //   home: Scaffold(
      //       appBar: AppBar(title: Text("Contoh Color")),
      //       body: Container(
      //           margin: EdgeInsets.all(50),
      //           height: 300,
      //           width: 400,
      //           alignment: Alignment.center,
      //           color: Colors.amber[900],
      //           child: Text(
      //             'Semangat Belajar',
      //             style: TextStyle(fontSize: 20, color: Colors.white),
      //           )
      //       )
      //   )

      // widget transform
      //   home: Scaffold(
      //       appBar: AppBar(title: Text("Contoh Transform")),
      //       body: Container(
      //         decoration: BoxDecoration(
      //           image: const DecorationImage(
      //             image: NetworkImage(
      //                 'https://akcdn.detik.net.id/community/media/visual/2023/08/30/cristiano-ronaldo-1_43.jpeg?w=600&q=90'),
      //             fit: BoxFit.fitWidth,
      //           ),
      //           border: Border.all(
      //             color: Colors.black,
      //             width: 8,
      //           ),
      //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //         ),
      //         height: 200,
      //         width: 400,
      //         margin: const EdgeInsets.only(left: 30.0, right:
      //         30.0, top: 30),
      //         // transform: Matrix4.rotationZ(-0.1),
      //       )
      //   ),

      // widget row
      // home: Scaffold(
      //   appBar: AppBar(title: Text("Contoh Row Widget")),
      //   body: Row(
      //     children: [
      //       Container(
      //         color: Colors.purpleAccent,
      //         child: FlutterLogo(
      //           size: 90.0,
      //         ),
      //       ),
      //       Container(
      //         color: Colors.greenAccent,
      //         child: FlutterLogo(
      //           size: 90.0,
      //         ),
      //       ),
      //       Container(
      //         color: Colors.orangeAccent,
      //         child: FlutterLogo(
      //           size: 90.0,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // widget column
      // home: Scaffold(
      //   appBar: AppBar(title: Text("Contoh Column Widget")),
      //   body: Column(
      //     children: [
      //       Container(
      //         color: Colors.purpleAccent,
      //         child: FlutterLogo(
      //           size: 90.0,
      //         ),
      //       ),
      //       Container(
      //         color: Colors.greenAccent,
      //         child: FlutterLogo(
      //           size: 90.0,
      //         ),
      //       ),
      //       Container(
      //         color: Colors.orangeAccent,
      //         child: FlutterLogo(
      //           size: 90.0,
      //         ),
      //       ),
      //     ],
      //   )
      // )

      // widget stack
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("Contoh Stack Widget"),
      //   ),
      //   body: Stack(
      //     children: <Widget>[
      //       Container(
      //         color: Colors.green,
      //         alignment:Alignment.bottomCenter,
      //         child: Text("Satu", style: TextStyle(fontSize:30,color:
      //         Colors.white)),
      //       ),
      //       Container(
      //         color: Colors.red,
      //         alignment:Alignment.bottomCenter,
      //         child: Text("Dua", style: TextStyle(fontSize:30,color:
      //         Colors.white)),
      //         height: 400.0,
      //         width: 300.0,
      //       ),
      //       Container(
      //         color: Colors.deepPurple,
      //         alignment:Alignment.bottomCenter,
      //         child: Text("Tiga", style: TextStyle(fontSize:30,color:
      //         Colors.white)),
      //         height: 200.0,
      //         width: 200.0,
      //       ),
      //     ],
      //   ),
      // ),

      // widget listview
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("Contoh ListView Widget"),
      //   ),
      //   body: ListView(
      //     children: <Widget>[
      //       ListTile(
      //         leading: Icon(Icons.map),
      //         title: Text('Map'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.photo_album),
      //         title: Text('Album'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.phone),
      //         title: Text('Phone'),
      //       ),
      //     ],
      //   ),
      // )

      // widget gridview
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Contoh GridView Widget"),
//         ),
//         body: GridView.count(
//           crossAxisCount: 2,
//           children: <Widget>
// [
//             Container(
//               color: Colors.green,
//               alignment:Alignment.bottomCenter,
//               child: Text("Satu", style: TextStyle(fontSize:30,color:
//               Colors.white)),
//             ),
//             Container(
//               color: Colors.red,
//               alignment:Alignment.bottomCenter,
//               child: Text("Dua", style: TextStyle(fontSize:30,color:
//               Colors.white)),
//               height: 400.0,
//               width: 300.0,
//             ),
//             Container(
//               color: Colors.deepPurple,
//               alignment:Alignment.bottomCenter,
//               child: Text("Tiga", style: TextStyle(fontSize:30,color:
//               Colors.white)),
//               height: 200.0,
//               width: 200.0,
//             ),
//             Container(
//               color: Colors.yellow,
//               alignment:Alignment.bottomCenter,
//               child: Text("Empat", style: TextStyle(fontSize:30,color:
//               Colors.white)),
//               height: 200.0,
//               width: 200.0,
//             ),
//           ],
//         ),
//       )

    // Pratikum
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Row(
          children: [
            SizedBox(
              width: 48.0,
              height: 48.0,
              child: Image.asset('assets/images/logo-live.png'),
            ),
            SizedBox(width: 8), // Add some spacing between the image and text
            Text(
              "808 Livesport",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/alnasr.jpeg',
                  fit: BoxFit.fitWidth,

                ),
                Container(
                    width: 400, // Set a fixed width for the container
                    child: Text(
                    'Live Sreaming Terbaru',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                    margin: const EdgeInsets.only(left: 10.0, right:10.0, top: 10.0)
                ),
                Container(
                    width: 400, // Set a fixed width for the container
                    child: Text(
                      'Al-Nasr vs Al-Ittihad',
                      style: TextStyle(fontSize: 18),
                    ),
                    margin: const EdgeInsets.only(left: 10.0, right:10.0, top: 5.0)
                ),
              ],
            )
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 70.0,
                      child: Image.asset('assets/images/match1.jpg'),
                    ),
                    SizedBox(width: 1), // Add some spacing between the image and text
                    Container(
                      width: 270, // Set a fixed width for the container
                      child: Text(
                        "EURO 2024, Pertandingan Germany vs France Dini Hari Nanti",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 70.0,
                      child: Image.asset('assets/images/match2.jpeg'),
                    ),
                    SizedBox(width: 1), // Add some spacing between the image and text
                    Container(
                      width: 270, // Set a fixed width for the container
                      child: Text(
                        "Pertandingan Indonesia vs Vietnam, FINAL AFF U-19",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 70.0,
                      child: Image.asset('assets/images/match3.jpeg'),
                    ),
                    SizedBox(width: 1), // Add some spacing between the image and text
                    Container(
                      width: 270, // Set a fixed width for the container
                      child: Text(
                        "DERBY JATIM, Persebaya vs Madura United, Live Streaming Indosiar",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 70.0,
                      child: Image.asset('assets/images/match4.jpg'),
                    ),
                    SizedBox(width: 1), // Add some spacing between the image and text
                    Container(
                      width: 270, // Set a fixed width for the container
                      child: Text(
                        "DERBY MANCESHTER, Manchester United vs Manchester City",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 70.0,
                      child: Image.asset('assets/images/match5.jpeg'),
                    ),
                    SizedBox(width: 1), // Add some spacing between the image and text
                    Container(
                      width: 270, // Set a fixed width for the container
                      child: Text(
                        "Behind The Scene Champions League, El Real vs Moscow",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 70.0,
                      child: Image.asset('assets/images/match6.jpg'),
                    ),
                    SizedBox(width: 1), // Add some spacing between the image and text
                    Container(
                      width: 270, // Set a fixed width for the container
                      child: Text(
                        "LAGI DERBY MILAN, Inter Milan vs AC Milan, Live Streaming RCTI",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 70.0,
                      child: Image.asset('assets/images/match7.jpeg'),
                    ),
                    SizedBox(width: 1), // Add some spacing between the image and text
                    Container(
                      width: 270, // Set a fixed width for the container
                      child: Text(
                        "Liga Jerman 2023, Dini hari nanti",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )

      );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
