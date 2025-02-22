import 'package:fauconsil/second.dart';
import 'package:fauconsil/views/pages/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', ''), Locale('fr')],
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      //SecondPage()
      Splashscreen()
      // MyHomePage(title: 'Flutter Page'),
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
    setState(() {

    });
    setState(() {
    print(_counter);
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
    appBar: AppBar(
      elevation: 10,
      backgroundColor: Colors.black,

      title: Text("Whatsapp",style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal
      ),),

      actions: [
        Icon(Icons.camera_alt,color: Colors.white,),
        SizedBox(width: 10,),
        Icon(Icons.search,color: Colors.white,),
        SizedBox(width: 10,),
        Icon(Icons.more_vert_outlined,color: Colors.white,),

        Text('aaa'),
      ],
    ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            IconButton(onPressed:() {
              
            }, icon: Icon(Icons.add)),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              alignment: Alignment.center,
              width: 70,
              height: 50,
              margin: EdgeInsets.only(
                  bottom: 5
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(20)
                )
              ),
              child: Text(
                "Idjnd",
                style: TextStyle(color: Colors.green,
                fontSize: 20),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
                onPressed: () {

Navigator.push(context, MaterialPageRoute(
  builder: (context) => SecondPage(),));
                }, child: Text("Aller vers la page 2"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.person),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}



class MaPageAuth extends StatelessWidget {
  const MaPageAuth({super.key});


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

