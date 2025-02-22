import 'package:fauconsil/second.dart';
import 'package:fauconsil/views/pages/loginpage.dart';
import 'package:flutter/material.dart';



class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

 void initState() {
    // TODO: implement initState
    super.initState();
    loadPage();
  }

  void loadPage() async {

      Future.delayed(
          const Duration(seconds: 10),
              () =>
                  Navigator.push(context,MaterialPageRoute(
                builder:(context) => const Loginpage()
                ,)
                  )
      );

  }

  String path="https://th.bing.com/th/id/R.38bd6604644819f046ef5a715a297dc3?rik=qpC%2fV5SZbzjOZA&riu=http%3a%2f%2fpicz.in%2fdata%2fmedia%2f7%2fstudy-in-canada-students.jpg&ehk=gsuMZq%2f2Q1kaTEVM1R588WjgIkvmouqlxzSCIAPelRo%3d&risl=1&pid=ImgRaw&r=0";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Assets.images.groupeLogoCase.image(),
              Image.asset('assets/scholar.png',
                  width: 200,height: 100,),

              const SizedBox(height: 20),
             /*
              Image.asset('assets/beach.jpg',
                  width: 200),
              Image.network(path,width: 100,height: 100,),

            */
              const Text(
                'FAUCON SIL3 APP',
                style: TextStyle(color: Colors.grey, fontSize: 24),
              ),
              const SizedBox(height: 15),
              const CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color:const Color(0xFF6666FF),
              )
            ],
          ),
        )
    );
  }
}
