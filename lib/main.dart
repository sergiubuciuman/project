import 'package:flutter/material.dart';
import 'package:project/calculation.dart';
import 'package:project/example.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DropDownButton',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fieldText = TextEditingController();
  final fieldText2 = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = 'without codes';
  bool isTapped = false;
  String value = '';
  int code1 = 0;
  int code2 = 0;
  int factoryCode = 0;

  var calc = new Calculation();
  var calcArea = new Example();

  // List of items in our dropdown menu

  final List<String> items = [
    'without codes',
    'with codes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delta factory code generator "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: fieldText,
              decoration: InputDecoration(
                hintText: "Type Code 1",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (text) {
                var rv = int.tryParse(text);
                if (rv != null) {
                  setState(() {
                    code1 = rv;
                  });
                }
              },
            ),
            TextField(
              controller: fieldText2,
              decoration: InputDecoration(
                hintText: "Type Code 2",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (text) {
                var rv = int.tryParse(text);
                if (rv != null) {
                  setState(() {
                    code2 = rv;
                  });
                }
              },
            ),
            DropdownButton(
              isExpanded: true,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownvalue = value!;
                });
              },
              value: dropdownvalue,
            ),
            //Spacer(),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    //isTapped = true;
                    var area = calcArea.calculateArea(2, 3, isTriangle: true);
                    value = dropdownvalue;
                    if (value == "without codes") {
                      fieldText.clear();
                      fieldText2.clear();
                      code1 = 0;
                      code2 = 0;
                      factoryCode = calc.generateFactoryCode();
                    } else {
                      factoryCode =
                          calc.generateFactoryCodeByCodes(code1, code2);
                    }
                  });
                },
                child: const Text('Generate Code')),
            SizedBox(
              height: 30,
            ),
            Text(factoryCode.toString()),
          ],
        ),
      ),
    );
  }
}
