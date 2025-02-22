import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool obscure=true;

  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String? _selectedValue;
  String? selectedItem;

  String path="https://st2.depositphotos.com/1594308/12210/i/950/depositphotos_122104490-stock-photo-smiing-female-college-student.jpg";



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
              labelText: "Nom :",
                border: OutlineInputBorder(

                )
              ),
            ),
            Image.network(path,width: 100,height: 100,),

            const SizedBox(height: 10,),
            TextFormField(
              obscureText: obscure,
              decoration: InputDecoration(
              labelText: "Prénom :",
                prefixIcon: Icon(Icons.person),
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
                border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 85,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact"),
                  SizedBox(height: 10,),

                ],
              ),
            ),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

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
            DropdownButtonFormField<String>(
              value: selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Select an option',
              ),
            ),

          ],
        ),

      ),
    );
  }
}
