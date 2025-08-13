import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/registrar_viewmodel.dart';

class RegistrarNuevo extends StatefulWidget {
  const RegistrarNuevo({super.key});

  @override
  State<RegistrarNuevo> createState() => _RegistrarNuevoState();
}

class _RegistrarNuevoState extends State<RegistrarNuevo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registrarViewModel = Provider.of<RegistrarViewModel>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Registrar Nuevo Usuario', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFB8B5FF).withOpacity(0.95),
        elevation: 8,
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
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 370,
                maxHeight: 600,
              ),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                color: const Color(0xFFF6E7E7),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Crea tu cuenta",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFB8B5FF)),
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: nombreController,
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            prefixIcon: const Icon(Icons.person, color: Color(0xFF6DDCCF)),
                            filled: true,
                            fillColor: const Color(0xFFFFF5E4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Ingrese su nombre' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: apellidoController,
                          decoration: InputDecoration(
                            labelText: 'Apellido',
                            prefixIcon: const Icon(Icons.person_outline, color: Color(0xFFB8B5FF)),
                            filled: true,
                            fillColor: const Color(0xFFFFF5E4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Ingrese su apellido' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email, color: Color(0xFF6DDCCF)),
                            filled: true,
                            fillColor: const Color(0xFFFFF5E4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Ingrese su email' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            prefixIcon: const Icon(Icons.account_circle, color: Color(0xFFB8B5FF)),
                            filled: true,
                            fillColor: const Color(0xFFFFF5E4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Ingrese un nombre de usuario' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: const Icon(Icons.lock, color: Color(0xFF6DDCCF)),
                            filled: true,
                            fillColor: const Color(0xFFFFF5E4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                          validator: (value) => value!.isEmpty ? 'Ingrese su contraseña' : null,
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6DDCCF),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await registrarViewModel.register(
                                  nombreController.text,
                                  apellidoController.text,
                                  emailController.text,
                                  usernameController.text,
                                  passwordController.text,
                                );
                                if (registrarViewModel.isRegistered) {
                                  Future.microtask(() {
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: const Text('Registro exitoso'),
                                        content: const Text('Tu usuario ha sido registrado correctamente.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Aceptar'),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                                }
                              }
                            },
                            child: const Text(
                              'Registrar',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                          ),
                        ),
                        if (registrarViewModel.errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              registrarViewModel.errorMessage!,
                              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ),
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