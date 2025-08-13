import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/triangulo_viewmodel.dart';
import '../widgets/result_triangulo_widget.dart';

class TrianguloView extends StatefulWidget {
  const TrianguloView({super.key});

  @override
  State<TrianguloView> createState() => _TrianguloViewState();
}

class _TrianguloViewState extends State<TrianguloView> {
  final TextEditingController lado1Controller = TextEditingController();
  final TextEditingController lado2Controller = TextEditingController();
  final TextEditingController lado3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final trianguloViewModel = Provider.of<TrianguloViewModel>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Tipo de Triángulo",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: const Color(0xFF90CAF9),
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F6F5), Color(0xFF90CAF9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 370,
                maxHeight: 520,
              ),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                color: const Color(0xFFE3F6F5),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Ingrese los lados del triángulo",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextField(
                        controller: lado1Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Lado 1",
                          labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(Icons.square_foot, color: Color(0xFF4A7CFF)),
                          filled: true,
                          fillColor: const Color(0xFF90CAF9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: lado2Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Lado 2",
                          labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(Icons.square_foot, color: Color(0xFF4A7CFF)),
                          filled: true,
                          fillColor: const Color(0xFF90CAF9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: lado3Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Lado 3",
                          labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(Icons.square_foot, color: Color(0xFF4A7CFF)),
                          filled: true,
                          fillColor: const Color(0xFF90CAF9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A7CFF),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                          ),
                          key: const Key("identificar"),
                          onPressed: () {
                            final lado1 = double.tryParse(lado1Controller.text) ?? 0;
                            final lado2 = double.tryParse(lado2Controller.text) ?? 0;
                            final lado3 = double.tryParse(lado3Controller.text) ?? 0;
                            trianguloViewModel.calcular("identificar", lado1, lado2, lado3);
                          },
                          child: const Text(
                            "Calcular Tipo de Triángulo",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ResultTrianguloWidget(trianguloViewModel: trianguloViewModel),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}