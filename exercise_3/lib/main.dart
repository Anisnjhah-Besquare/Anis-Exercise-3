import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Page',
      theme: ThemeData(
        //textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme) ,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Welcome Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? username;
  String? email;
  String? password;

  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  var valueGender;

  List listGender = ["Male", "Female"];

  final String _imageUrl =
      'https://i.ytimg.com/vi/ImC2Rf2sJRA/maxresdefault.jpg';

  ///Class to demonstrate how to use Image, Snackbar, and Spier
  /*class ImageSnackBarSpinner extends StatelessWidget {
    final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = 
    GlobalKey<ScaffoldMessengerState>();
    final String _imageUrl = 'https://i.ytimg.com/vi/ImC2Rf2sJRA/maxresdefault.jpg';*/
  textChecking() {
    String text1, text2, text3;

    text1 = textController1.text;
    text2 = textController2.text;
    text3 = textController3.text;

    /*if (text1 == textController1.text.isNotEmpty ||
        text2 == textController2.text.isNotEmpty ||
        text3 == textController3.text.isNotEmpty) {
      final SnackBar1 = SnackBar(
        content: const Text('Register Successful'),
        action: SnackBarAction(
          label: 'close',
          onPressed: () {},
        ),
      );
    }*/

    if (text1 == '' || text2 == '' || text3 == '') {
      final snackBar = SnackBar(
        content: const Text('Please fill up all the field'),
        action: SnackBarAction(
          label: 'close',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: const Text("You have successfully registered!"),
         action: SnackBarAction(
          label: 'close',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: Text(widget.title),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              _imageUrl,
            ),
            /*Image.asset(
            'images/deriv-logo.png'
            ),*/
            /* SizedBox(
            height: 80.0,
          ),*/
            /* CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 50.0,
          ),*/
            ///box for username
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: TextField(
                controller: textController1,
                 autofocus: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  labelText: 'Username',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: TextField(
                controller: textController2,
                autofocus: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  labelText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: TextField(
                controller: textController3,
                 autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  labelText: 'Password',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ),
             
            DropdownButton(
              value: valueGender,
              onChanged: (newValue) {
                setState(() {
                  valueGender = newValue;
                });
              },
              items: listGender.map((valueGender) {
                return DropdownMenuItem(
                  value: valueGender,
                  child: Text(valueGender),
                );
              }).toList(),
            ),

            ///register button to be pressed
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: MaterialButton(
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: textChecking,
              ),
            )
          ],
        ),
      )
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          // child: Image.network(_imageUrl)(

          ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
