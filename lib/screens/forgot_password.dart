import 'package:echanyoba/screens/login_screen.dart';
import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatefulWidget {
  static const String id = 'ForgotPasswordPage';

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  bool _hasErrorOldPassword = false; // Untuk validasi Old Password
  bool _hasErrorNewPassword = false; // Untuk validasi New Password

  void _validateForm() {
    setState(() {
      _hasErrorOldPassword = _oldPasswordController.text.isEmpty;
      _hasErrorNewPassword = _newPasswordController.text.isEmpty ||
          !_newPasswordController.text.contains(RegExp(r'(?=.*?[A-Z])')) ||
          !_newPasswordController.text.contains(RegExp(r'(?=.*?[0-9])'));
    });

    if (!_hasErrorOldPassword && !_hasErrorNewPassword) {
      // Jika tidak ada error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password changed successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Tambahkan ini agar ukuran layar tidak berubah
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Reset Password',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginView.id);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Please enter your old password and new password.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // Field Old Password
              TextFormField(
                controller: _oldPasswordController,
                decoration: InputDecoration(
                  labelText: 'Old Password',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color:
                      _hasErrorOldPassword ? Colors.red : Colors.grey[300]!,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: _hasErrorOldPassword ? Colors.red : Colors.teal,
                      width: 2.0,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Old Password cannot be empty';
                  }
                  return null;
                },
              ),
              if (_hasErrorOldPassword) ...[
                const SizedBox(height: 5),
                const Text(
                  'Old Password cannot be empty',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
              ],
              const SizedBox(height: 20),

              // Field New Password
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color:
                      _hasErrorNewPassword ? Colors.red : Colors.grey[300]!,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: _hasErrorNewPassword ? Colors.red : Colors.teal,
                      width: 2.0,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'New Password cannot be empty';
                  } else if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
                    return 'New Password must contain at least one uppercase letter';
                  } else if (!RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
                    return 'New Password must contain at least one number';
                  }
                  return null;
                },
              ),
              if (_hasErrorNewPassword) ...[
                const SizedBox(height: 5),
                const Text(
                  'New Password must contain at least one uppercase letter and one number',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
              ],
              const SizedBox(height: 30),

              // Tombol Kirim
              Center(
                child: ElevatedButton(
                  onPressed: _validateForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Change',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginView.id);
                  },
                  child: const Text(
                    'Back to Login Page',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.teal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Footer bantuan
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Need help? Please contact via',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.email, size: 18, color: Colors.teal),
                        SizedBox(width: 5),
                        Text(
                          'mecachan03@gmail.com',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
