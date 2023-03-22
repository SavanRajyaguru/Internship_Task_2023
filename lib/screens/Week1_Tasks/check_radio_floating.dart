import 'package:flutter/material.dart';

class BasicWidget extends StatefulWidget {
  const BasicWidget({Key? key}) : super(key: key);

  @override
  State<BasicWidget> createState() => _BasicWidgetState();
}

enum SingingCharacter { rajkot, ahmedabad }

class _BasicWidgetState extends State<BasicWidget> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  SingingCharacter? _character = SingingCharacter.rajkot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Widget"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: (bool? value){
                setState(() {
                  isChecked = value!;
                });
              }),
              const Text("Rajkot")
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: isChecked1,
                  onChanged: (bool? value){
                    setState(() {
                      isChecked1 = value!;
                    });
                  }),
              const Text("Ahmedabad")
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: isChecked2,
                  onChanged: (bool? value){
                    setState(() {
                      isChecked2 = value!;
                    });
                  }),
              const Text("Nadiad")
            ],
          ),
          const SizedBox(height: 100.0,),
          ListTile(
            title: const Text('Rajkot'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.rajkot,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Ahmedabad'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.ahmedabad,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
