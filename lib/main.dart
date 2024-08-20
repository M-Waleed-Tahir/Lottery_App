import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lottery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'MyHomePage',
      ),
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
  Random random = Random();
  int x = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
            child: Text(
          'Lottery App',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Lottery Winning number is $x',
                style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
                color: x == 1
                    ? Colors.green.withOpacity(0.4)
                    : Colors.red.withOpacity(0.4),
                borderRadius: BorderRadius.circular(22)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: x == 1
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.done_all,
                          color: Colors.green,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                            'Congratulations You Have Won The Lottery😎\n Your Winning No is $x ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400))
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                            'Better Luck Next Time Your Number is $x \n Try Again😢 ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w400))
                      ],
                    ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          x = random.nextInt(10);

          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
