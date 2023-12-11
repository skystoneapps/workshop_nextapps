import 'package:flutter/material.dart';

class FormExampleScreen extends StatefulWidget {
  const FormExampleScreen({super.key});

  @override
  State<FormExampleScreen> createState() => _FormExampleScreenState();
}

class _FormExampleScreenState extends State<FormExampleScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Switch.adaptive(
                value: true,
                onChanged: (v) {},
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: TextEditingController(
                  text: "Test",
                ),
                validator: (value) => value!.isEmpty ? 'provide value' : null,
                onSaved: (value) => print('Saved value: $value'),
              ),
              TextButton(
                  onPressed: () {
                    final valid = formKey.currentState?.validate();
                    formKey.currentState?.save();
                  },
                  child: Text('Validate')),
            ],
          ),
        ),
      ),
    );
  }
}
