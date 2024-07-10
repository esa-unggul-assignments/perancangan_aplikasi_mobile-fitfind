import 'package:flutter/material.dart';
import "../../widgets/custom_button.dart";

class EmailPasswordForm extends StatefulWidget {
  final VoidCallback onPressBack;
  final void Function(String email, String password) onSubmit;
  final String submitButtonText;

  EmailPasswordForm({
    required this.onPressBack,
    required this.onSubmit,
    required this.submitButtonText,
  });

  @override
  _EmailPasswordFormState createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                labelText: 'Email',
                hintText: 'Masukkan email Anda',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Masukkan email yang valid';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                labelText: 'Password',
                hintText: 'Masukkan password Anda',
                border: InputBorder.none,
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    label: 'Back',
                    labelColor: Colors.lime,
                    backgroundColor: Colors.black,
                    borderRadius: 24,
                    onPressed: widget.onPressBack),
                CustomButton(
                    label: widget.submitButtonText,
                    labelColor: Colors.black,
                    backgroundColor: Colors.lime,
                    borderRadius: 24,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSubmit(
                          _emailController.text,
                          _passwordController.text,
                        );
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
