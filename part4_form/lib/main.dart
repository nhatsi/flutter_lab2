import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Application'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/lg.jpg',
              width: 100,
              height: 100,
            ),

            CustomTextField(
              label: 'First Name',
              controller: firstNameController,
            ),
            CustomTextField(
              label: 'Last Name',
              controller: lastNameController,
            ),

            const CustomTextField(
              label: 'Email',
              suffixText: '@tdtu.edu.vn',
            ),
            const CustomTextField(
              label: 'Phone Number',
              keyboardType: TextInputType.phone,
            ),

            const Divider(indent: 8, endIndent: 8),

            const CustomTextField(
              label: 'Username',
            ),
            const CustomTextField(
              label: 'Password',
              obscureText: true,
            ),
            const CustomTextField(
              label: 'Confirm Password',
              obscureText: true,
            ),

            ElevatedButton(
              onPressed: () {
                final fullName =
                    '${firstNameController.text} ${lastNameController.text}';

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Registration Successful"),
                    content: Text("Welcome, $fullName"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? prefixText;
  final String? suffixText;
  final int? maxLength;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.maxLength,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        inputFormatters: maxLength != null
            ? [LengthLimitingTextInputFormatter(maxLength)]
            : null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixText: suffixText,
          prefixText: prefixText,
        ),
      ),
    );
  }
}