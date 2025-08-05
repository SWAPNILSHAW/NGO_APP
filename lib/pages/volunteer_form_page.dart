import 'package:flutter/material.dart';

import '../utils/share_app.dart';

class VolunteerFormPage extends StatefulWidget {
  @override
  _VolunteerFormPageState createState() => _VolunteerFormPageState();
}

class _VolunteerFormPageState extends State<VolunteerFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();

  final Color themeColor = const Color(0xFF1B5E20); // deep green
  final Color lightBg = const Color(0xFFF5F5F5); // soft background

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Thank you, $name! We'll contact you soon."),
          backgroundColor: themeColor,
        ),
      );
      _formKey.currentState!.reset();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        title: const Text("Volunteer Form",style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: themeColor,
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Join as a Volunteer",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: themeColor,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _nameController,
                    decoration: _inputDecoration("Full Name"),
                    validator: (value) =>
                    value!.trim().isEmpty ? "Please enter your name" : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _phoneController,
                    decoration: _inputDecoration("Phone Number"),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return 'Phone is required';
                      if (value.length < 10) return 'Enter valid phone number';
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _cityController,
                    decoration: _inputDecoration("City"),
                    validator: (value) =>
                    value!.trim().isEmpty ? "Please enter your city" : null,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: _submitForm,
                    icon: const Icon(Icons.send),
                    label: const Text("Submit",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // ✅ Floating Share Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: shareApp,
        icon: const Icon(Icons.share,color: Colors.white,),
        label: const Text("Share", style: TextStyle(fontSize: 16, color: Colors.white),),
        backgroundColor: themeColor,
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black87),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: themeColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

