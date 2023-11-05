import 'package:aplikasi_bacaan_solat/services/recommendation.dart';
import 'package:aplikasi_bacaan_solat/view/screens/result.dart';
import 'package:flutter/material.dart';

class SmartphoneScreen extends StatefulWidget {
  const SmartphoneScreen({super.key});

  @override
  State<SmartphoneScreen> createState() => _SmartphoneScreenState();
}

class _SmartphoneScreenState extends State<SmartphoneScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  bool isloading = false;

  void _getrecommendation() async {
    setState(() {
      isloading = true;
    });

    try {
      final result = await RecommendationService()
          .getrecommendation(message: _controller.text);
      if (mounted) {
        setState(() {
          isloading = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return Result(gptResponseData: result);
          }),
        );
      }
    } catch (e) {
      const snackbar = SnackBar(
        content: Text('Failed to send request, try again'),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Silahkan Masukan apa yang ingn anda ketahui tentang islam')),
      body: Form(
        key: _formState,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _controller,
                decoration: const InputDecoration(
                  label: Text('Masukkan Data disini'),
                  // GANTI HINT TEXT SESUAI APLIKASI
                  hintText: 'Masukan apa saja yang berkaitan dengan agama islam',
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon masukkan kata';
                  }
                  return null;
                },
              ),
               
              Padding(
                padding: const EdgeInsets.all(8),
                child: isloading && _formState.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _getrecommendation,
                        child: const Center(
                          child: Text("Tampilkan data "),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
