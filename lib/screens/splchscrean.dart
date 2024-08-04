import 'package:flutter/material.dart';

import 'homepage.dart';

class Splchscrean extends StatefulWidget {
  const Splchscrean({super.key});

  @override
  State<Splchscrean> createState() => _SplchscreanState();
}

class _SplchscreanState extends State<Splchscrean> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(139, 82, 255, 1),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/logooo.jpg')],
      )),
    );
  }
}
