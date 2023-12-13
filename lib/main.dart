import 'package:bootstrap_cm/login_page.dart';
import 'package:flutter/material.dart';
import 'todo_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Grocery App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
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

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,

                ),
                child: Text("Welcome to the Grocery App",
                  style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.w500),),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,

                ),
                child: Text("Click the plus sign to continue",
                  style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.w500),),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Text("Click the arrow buttons to continue",
                  style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Text("Use this app to track groceries and meal plans",
                  style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,),
              )
          ]
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

