import 'package:flutter/material.dart';

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
        // the application has a purple toolbar. Then, without quitting the app,
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 243, 243, 243)),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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

      body: Center(
        child: WelcomeWidget()
      ),
      // appBar: AppBar(
        
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return
      Container(
        padding: EdgeInsets.all(16.0),
        color: Color.fromRGBO(243, 243, 243, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("SOVA", style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w500
          )), Text("Добро пожаловать! Войдите в свой профиль, чтобы приступить к занятиям."), ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CustomForm()));
          }, child: Text("Войти"))],
        ),
      );
    //  Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Text("SOVA", style: TextStyle(
    //     fontSize: 64,
    //     fontWeight: FontWeight.w500
    //   )), Text("Добро пожаловать! Войдите в свой профиль, чтобы приступить к занятиям."), ElevatedButton(onPressed: () {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => CustomForm()));
    //   }, child: Text("Войти"))],
    // );
  }
}

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Form(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back)),
          TextField(decoration: 
            InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Почта",
            )
          ),
          TextField(decoration: 
            InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Пароль",
            )
          ),
          ElevatedButton(onPressed: () {}, child: Text("Отправить"))
        ],
      )
    ),
      ),
    );
  }
}
