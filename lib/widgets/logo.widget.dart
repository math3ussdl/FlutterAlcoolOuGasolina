import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/aog-white.png',
          height: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Álcool ou Gasolina',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Big Shoulders Display',
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
