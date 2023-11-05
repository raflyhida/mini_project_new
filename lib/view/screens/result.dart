import 'package:aplikasi_bacaan_solat/models/open_ai.dart';
import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final GptData gptResponseData;
  const Result({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smartphone Recommendations'),//INI JUGA DI GANTI
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              "Recommendations",//BOLEH DI GANTI DENGAN KATA YANG LAIN
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              gptResponseData.choices[0].text,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
