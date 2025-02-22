import 'package:fauconsil/views/utils/app_fonctions.dart';
import 'package:fauconsil/views/utils/appcolors.dart';
import 'package:fauconsil/views/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final nom  = TextEditingController();
  final prenom  = TextEditingController();
  final email  = TextEditingController();
  final naissance  = TextEditingController();
  final password = TextEditingController();
  final date_debut = TextEditingController();
  final nombre_place = TextEditingController();
  final nationalite = TextEditingController();
  final profession = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String? _selectedValue;
  String? selectedItem;

  bool  obscure= false;
  final globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Text(
            "Inscription",),
          elevation: 1,

        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Form(
                key: globalkey,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: TextFormField(
                                  controller: nom,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) =>
                                  value!.isEmpty ? "Veuillez remplir" : null,
                                  textCapitalization:
                                  TextCapitalization.characters,
                                  style: TextStyles.subtitleStyle
                                      .copyWith(color: AppColor.black),
                                  decoration:
                                  text_form_field_decoration_app.copyWith(
                                    labelText: "*Nom",
                                    prefixIcon: const Icon(Icons.person,color: Colors.black,),
                                    labelStyle: TextStyles.subtitleStyle
                                        .copyWith(
                                        color: AppColor.textGrey,
                                        fontSize: 15),
                                  ))),
                          const SizedBox(
                            width: 12.5,
                          ),
                          Flexible(
                              flex: 1,
                              child: TextFormField(
                                  controller: prenom,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization:
                                  TextCapitalization.characters,
                                  style: TextStyles.subtitleStyle
                                      .copyWith(color: AppColor.black),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: prenom.value.text.isEmpty
                                              ? const Color(0xffC2C2C2)
                                              : Colors.green,
                                        width: prenom.value.text.isEmpty
                                              ? 1.5
                                              : 2.0,
                                        ),
                                      ),
                                      labelText: "*Prénom ",
                                      labelStyle: TextStyles.subtitleStyle
                                          .copyWith(
                                          color: AppColor.textGrey,
                                          fontSize: 15),
                                      suffixIcon: InkWell(
                                          onTap: () async {

                                          },
                                          child: Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: AppColor.textGrey,
                                            size: 25,
                                          ))))),

                        ],
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select an option',
                      ),
                      value: _selectedValue,
                      items: ['Option 1', 'Option 2', 'Option 3']
                          .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: TextFormField(
                                  onTap: () => showDatePicker(
                                    locale: const Locale("fr", "FR"),
                                    lastDate: DateTime(2300),
                                    context: context,
                                    builder: (context, child) => Theme(
                                        data: ThemeData.light(),
                                        child: child!),
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                  ).then((date1) {
                                    if (date1 != null) {
                                      date_debut.text = date_format(date1);
                                      setState(() {});
                                    }
                                  }),
                                  readOnly: true,
                                  controller: date_debut,
                                  validator: (value) => value!.isEmpty
                                      ? 'Veuillez remplir'
                                      : null,
                                  textCapitalization:
                                  TextCapitalization.characters,
                                  style: TextStyles.subtitleStyle
                                      .copyWith(color: AppColor.black),
                                  decoration:
                                  text_form_field_decoration_app.copyWith(
                                    labelText: "*Date de naissance",
                                    labelStyle: TextStyles.subtitleStyle
                                        .copyWith(
                                        color: AppColor.textGrey,
                                        fontSize: 15),
                                  ))),
                          const SizedBox(
                            width: 12.5,
                          ),

                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: TextFormField(
                                  controller: nationalite,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization:
                                  TextCapitalization.characters,
                                  style: TextStyles.subtitleStyle
                                      .copyWith(color: AppColor.black),
                                  decoration:
                                  text_form_field_decoration_app.copyWith(
                                    labelText: "Nationalité",
                                    labelStyle: TextStyles.subtitleStyle
                                        .copyWith(
                                        color: AppColor.textGrey,
                                        fontSize: 15),
                                  ))),
                          const SizedBox(
                            width: 12.5,
                          ),
                          Flexible(
                              flex: 1,
                              child: TextFormField(
                                  controller: profession,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization:
                                  TextCapitalization.characters,
                                  style: TextStyles.subtitleStyle
                                      .copyWith(color: AppColor.black),
                                  decoration:
                                  text_form_field_decoration_app.copyWith(
                                    labelText: "Profession",
                                    labelStyle: TextStyles.subtitleStyle
                                        .copyWith(
                                        color: AppColor.textGrey,
                                        fontSize: 15),
                                  ))),

                        ],
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: TextFormField(
                          controller: nombre_place,
                          textInputAction: TextInputAction.next,
                          validator: (value) =>
                          value!.isEmpty ? "Veuillez remplir " : null,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyles.subtitleStyle
                              .copyWith(color: AppColor.black),
                          decoration: text_form_field_decoration_app.copyWith(
                            labelText: "*Nombre de places",
                            labelStyle: TextStyles.subtitleStyle.copyWith(
                                color: AppColor.textGrey, fontSize: 15),
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: email,
                          validator: (value) =>
                          value!.isEmpty ? "Veuillez remplir " : null,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyles.subtitleStyle
                              .copyWith(color: AppColor.black),
                          decoration: text_form_field_decoration_app.copyWith(
                            labelText: "*Email",
                            labelStyle: TextStyles.subtitleStyle.copyWith(
                                color: AppColor.textGrey, fontSize: 15),
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: password,
                                validator: (value) =>
                                value!.isEmpty ? "Veuillez remplir " : null,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyles.subtitleStyle
                                    .copyWith(color: AppColor.black),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: password.value.text.isEmpty
                                          ? const Color(0xffC2C2C2)
                                          : Colors.green,
                                      width: password.value.text.isEmpty
                                          ? 1.5
                                          : 2.0,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2.0,
                                    ),
                                  ),
                                  labelText: "*Valeure neuve ",
                                  labelStyle: TextStyles.subtitleStyle.copyWith(
                                      color: AppColor.textGrey, fontSize: 15),
                                )),
                          ),
                          const SizedBox(
                            width: 12.5,
                          ),

                        ],
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Checkbox(
                                  value:true,
                                  onChanged: (value) {
                                    /*
                                    if (change_csa) {
                                      csa = value!;
                                      setState(() {});
                                    }
                                    */
                                  },
                                ),
                                const Text('Constat aimiable')
                              ],
                            ),
                          ),
                          const Spacer(),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                const Text("TVL")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.blue,
                              backgroundColor: const Color(0xFF6666FF),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                          //style: elevate_button_style,
                          onPressed: () async {
                            int cap_deces = 0,
                                cap_inv = 0,
                                cap_fmd = 0,
                                prm_dec = 0,
                                prm_inv = 0,
                                prm_fmd = 0;
                            if (globalkey.currentState!.validate()) {




                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            child: const Text(
                              "Valider",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "REPRENDRE LA SAISIE ?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    )
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
