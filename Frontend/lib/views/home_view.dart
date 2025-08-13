import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/operacion_viewmodel.dart';
import '../widgets/result_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OperacionViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Operaciones Básicas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF6DDCCF),
            fontSize: 24,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: const Color(0xFFF6E7E7),
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F6F5), Color(0xFFF6E7E7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
              maxHeight: 700,
            ),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              color: const Color(0xFFF6E7E7),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: const BoxDecoration(
                            color: Color(0xFFB8B5FF),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(24),
                              top: Radius.circular(24),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Bienvenido a la Calculadora",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.2,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black12,
                                      offset: Offset(1, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Ingresa dos números y selecciona una operación",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextField(
                          controller: numero1Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Número 1",
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFFFF5E4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xFFB8B5FF),
                                width: 1.2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xFF6DDCCF),
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: numero2Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Número 2",
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFFFF5E4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xFF6DDCCF),
                                width: 1.2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xFFB8B5FF),
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 18),
                        OperationCard(
                          key: const ValueKey('sumarButton'),
                          icon: Icons.add,
                          color: const Color(0xFF6DDCCF),
                          label: "Sumar",
                          onTap: () {
                            final num1 = double.tryParse(numero1Controller.text) ?? 0;
                            final num2 = double.tryParse(numero2Controller.text) ?? 0;
                            viewModel.calcular("sumar", num1, num2);
                          },
                        ),
                        OperationCard(
                          key: const ValueKey('restarButton'),
                          icon: Icons.remove,
                          color: const Color(0xFFB8B5FF),
                          label: "Restar",
                          onTap: () {
                            final num1 = double.tryParse(numero1Controller.text) ?? 0;
                            final num2 = double.tryParse(numero2Controller.text) ?? 0;
                            viewModel.calcular("restar", num1, num2);
                          },
                        ),
                        OperationCard(
                          key: const ValueKey('multiplicarButton'),
                          icon: Icons.close,
                          color: const Color(0xFFFFC1A1),
                          label: "Multiplicar",
                          onTap: () {
                            final num1 = double.tryParse(numero1Controller.text) ?? 0;
                            final num2 = double.tryParse(numero2Controller.text) ?? 0;
                            viewModel.calcular("multiplicar", num1, num2);
                          },
                        ),
                        OperationCard(
                          key: const ValueKey('dividirButton'),
                          icon: Icons.horizontal_rule,
                          color: const Color(0xFF90CAF9),
                          label: "Dividir",
                          onTap: () {
                            final num1 = double.tryParse(numero1Controller.text) ?? 0;
                            final num2 = double.tryParse(numero2Controller.text) ?? 0;
                            viewModel.calcular("dividir", num1, num2);
                          },
                        ),
                        const SizedBox(height: 18),
                        ResultWidget(viewModel: viewModel),
                      ],
                    ),
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

class OperationCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const OperationCard({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: color.withOpacity(0.18),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.7),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
            letterSpacing: 1.1,
          ),
        ),
        trailing: ElevatedButton(
          key: ValueKey('${label.toLowerCase()}Button'),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            elevation: 4,
          ),
          onPressed: onTap,
          child: const Text(
            "Calcular",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
    );
  }
}
