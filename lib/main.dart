import 'package:flutter/material.dart';

enum PaymentMethods { bKash, rocket, nagad, sureCash, ucash, bankTransfer }

enum MaritialStatus { single, married, divorced, widowed }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void detectPaymentMethod(PaymentMethods paymentMethod) {
    switch (paymentMethod) {
      case PaymentMethods.bKash:
        print('bKash');
        break;
      case PaymentMethods.rocket:
        print('rocket');
        break;
      case PaymentMethods.nagad:
        print('nagad');
        break;
      case PaymentMethods.sureCash:
        print('sureCash');
        break;
      case PaymentMethods.ucash:
        print('ucash');
        break;
      case PaymentMethods.bankTransfer:
        print('bankTransfer');
        break;
    }
  }

  void detectNumber(String number) {
    if (number.startsWith('017')) {
      print('GP');
    } else if (number.startsWith('018')) {
      print('Robi');
    } else if (number.startsWith('019')) {
      print('Banglalink');
    } else if (number.startsWith('016')) {
      print('Airtel');
    } else if (number.startsWith('015')) {
      print('Teletalk');
    }
  }

  void detectAge(int age) {
    if (age >= 18) {
      print('adult');
    } else {
      print('child');
    }
  }

  void getMaritialStatus(MaritialStatus maritialStatus) {
    switch (maritialStatus) {
      case MaritialStatus.single:
        print('single');
        break;
      case MaritialStatus.married:
        print('married');
        break;
      case MaritialStatus.divorced:
        print('divorced');
        break;
      case MaritialStatus.widowed:
        print('widowed');
        break;
    }
  }

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(
                  hintText: 'Enter your number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => detectNumber(_numberController.text),
              child: const Text('Detect Sim Card'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => detectPaymentMethod(PaymentMethods.nagad),
              child: const Text('Detect Payment Method'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  hintText: 'Enter your age',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => detectAge(int.parse(_ageController.text)),
              child: const Text('Detect Age'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => getMaritialStatus(MaritialStatus.single),
              child: const Text('Detect Maritial Status'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
