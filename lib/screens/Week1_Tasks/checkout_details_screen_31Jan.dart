import 'package:flutter/material.dart';

class CheckoutDetails extends StatefulWidget {
  const CheckoutDetails({Key? key}) : super(key: key);

  @override
  State<CheckoutDetails> createState() => _CheckoutDetailsState();
}
const List<String> years = <String>[
    'YYYY',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
];
const List<String> months = <String>[
  'MM',
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12'
];
class _CheckoutDetailsState extends State<CheckoutDetails> {
  String dropdownMonth = months.first;
  String dropdownYear = years.first;
  final myController = TextEditingController();
  bool submit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.addListener(() {
      setState(() {
        submit = myController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 80.0, left: 20.0, bottom: 20.0),
            child: Text(
              "Checkout details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                margin: const EdgeInsets.only(right: 40.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.deepPurpleAccent,
                          Colors.purpleAccent
                        ])),
              ),
              Column(
                children: [
                  const Icon(
                    Icons.camera_alt_rounded,
                    size: 50.0,
                    color: Colors.white,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("SCAN CARD",
                        style: TextStyle(color: Colors.purpleAccent)),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150.0, 50.0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        backgroundColor: Colors.white),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter holder name';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Card holder",
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter card number';
                }
                return null;
              },
              maxLength: 16,
              decoration: const InputDecoration(
                labelText: "Card number",
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Code",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "Expiration date",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.0,
                  child: TextFormField(
                    controller: myController,
                    maxLength: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter card number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 130.0,),
                DropdownButton(
                  value: dropdownMonth,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: months.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownMonth = newValue!;
                    });
                  },
                ),
                const SizedBox(width: 10.0,),
                DropdownButton(
                  value: dropdownYear,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: years.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownYear = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: ElevatedButton(
                  onPressed: submit ? () => print("done") : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                    backgroundColor: submit ? Colors.purpleAccent : Colors.red,
                    minimumSize: const Size.fromHeight(70.0)
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 24.0),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
