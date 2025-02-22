import 'package:fauconsil/views/pages/signinpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';



class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

 // final numero = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  bool  obscure= false;
  final globalkey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: const SizedBox(),
          centerTitle: true,
          title: const  Text(
            "Connexion",
            //style: appbar_style,
          ),
        ),
        body: SafeArea(
          child:
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Form(
              key: globalkey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Bienvenue sur ",
                            children: [
                              TextSpan(
                                text: "Faucon App",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize:
                                    MediaQuery.of(context).size.width / 15,
                                    color:Colors.red),

                              )
                            ],
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize:
                                MediaQuery.of(context).size.width / 15,
                                color:Colors.black),
                          )),
                    ),
                    Image(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        image: const AssetImage('assets/scholar.png')),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 13),
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) =>
                            value!.isEmpty ? "Veuillez remplir" : null,
                            textCapitalization:
                            TextCapitalization.characters,
                            decoration:const InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email,color: Colors.black,),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent,width: 1.5
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ))
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 13),
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        child: TextFormField(
                            controller: password,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            validator: (value) =>
                            value!.isEmpty ? "Veuillez remplir" : null,
                            textCapitalization:
                            TextCapitalization.characters,
                            obscureText: obscure,
                            decoration: InputDecoration(
                                labelText: "Mot de passe ",
                                prefixIcon: const Icon(Icons.lock,
                                  color: Colors.black,),
                                suffixIcon: IconButton(
                                  icon:Icon(
                                      obscure? Icons.visibility_off:
                                      Icons.visibility),
                                  onPressed: () {
                                    obscure=!obscure;
                                    setState(() {
                                    });
                                  },
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent,width: 1.5
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ))
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 13),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              backgroundColor: Colors.blue),
                          onPressed: () async {
                            if (globalkey.currentState!.validate()) {
                              try {

                              } catch (e) {

                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            child: const Text(
                              "Se connecter",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 20),
                        child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(context, MaterialPageRoute(builder:
                                            (context) => const SignInPage(),));
                                      },
                                    text: " Créer un compte  ",
                                    style: const TextStyle(color: Colors.blueAccent, fontSize: 15.0)
                                    ,
                                  )
                                ],
                                text: "Je n'ai pas encore un compte ",
                                style:
                                const TextStyle(color: Color(0xFFafb1b5), fontSize: 15.0)
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),


        ),
      ),
    );
  }
}
