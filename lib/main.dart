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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: const Color.fromARGB(255, 4, 4, 4),
          // seedColor: const Color.fromARGB(255, 235, 235, 235),
          // primary: const Color.fromARGB(255, 19, 19, 19),
        ),
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
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
      body: Center(child: WelcomeWidget()),
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        // color: Color.fromRGBO(243, 243, 243,ß 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SOVA",
                style: TextStyle(fontSize: 64, fontWeight: FontWeight.w500)),
            Text(
                "Добро пожаловать! Войдите в свой профиль, чтобы приступить к занятиям."),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CustomForm()));
                },
                child: Text("Войти"))
          ],
        ),
      ),
    ); //  Column(
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

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme.primary;

    String title;
    switch (index) {
      case 0:
        title = "Курсы";
        break;
      case 1:
        title = "Статистика";
        break;
      case 2:
        title = "Профиль";
      default:
        throw UnimplementedError('no title for $index');
    }

    Widget screen;
    switch (index) {
      case 0:
        screen = CoursesPage();
        break;
      case 1:
        screen = Statspage();
        break;
      case 2:
        screen = ProfilePage();
        break;
      default:
        throw UnimplementedError('no widget for $index');
    }

    // final theme = Theme .of(context).colorScheme.surface;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(title),
        ),
        body: Container(
          // color: Theme.of(context).
          // color: theme,
          child: screen,
        ),
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int currentIndex) {
              setState(() {
                index = currentIndex;
              });
            },
            selectedIndex: index,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Курсы"),
              NavigationDestination(
                  icon: Icon(Icons.assessment_sharp), label: "Статистика"),
              NavigationDestination(
                  icon: Icon(Icons.account_circle), label: "Профиль"),
            ]));
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
              TextField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Почта",
              )),
              TextField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Пароль",
              )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: Text("Отправить"))
            ],
          )),
        ),
      ),
    );
  }
}

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Доступные курсы"),
              SizedBox(
                height: 10,
              ),
              CourseWidget(courseLabel: "Курс 1"),
              CourseWidget(courseLabel: "Курс 2"),
              CourseWidget(courseLabel: "Курс 3"),
              CourseWidget(courseLabel: "Курс 4"),
              CourseWidget(courseLabel: "Курс 5"),
              CourseWidget(courseLabel: "Курс 6"),
              CourseWidget(courseLabel: "Курс 7"),
            ],
          ),
        ));
      }),
    );
    // return ListView(
    //   children: [
    //     CourseWidget(courseLabel: "Курс 1"),
    //     CourseWidget(courseLabel: "Курс 2")
    //   ],
    // );
  }
}

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    super.key,
    required this.courseLabel,
  });

  final String courseLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CoursePage(
                            title: courseLabel,
                          )));
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mms_outlined),
                    SizedBox(width: 25),
                    Text(courseLabel),
                  ],
                ))),
        SizedBox(
          height: 10,
          width: 0,
        )
      ],
    );
  }
}

class Statspage extends StatelessWidget {
  const Statspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Статистика занятий"),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("С возвращением, Андрей!"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileSettingsPage()));
              },
              child: Text("Настройки")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeWidget()));
              },
              child: Text("Выйти"))
        ],
      ),
    );
    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text("С возвращением, Андрей!"),
    //       ElevatedButton(onPressed: () {}, child: Text("Настройки")),
    //       ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => WelcomeWidget()));
    //           },
    //           child: Text("Выйти"))
    //     ],
    //   ),
    // );
  }
}

class CoursePage extends StatelessWidget {
  const CoursePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // return
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // automaticallyImplyLeading: true,
      ),
    );
  }
}

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Настройки"),
        // automaticallyImplyLeading: true,
      ),
      body: Center(),
    );
  }
}
