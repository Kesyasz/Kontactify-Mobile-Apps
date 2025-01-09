import 'package:flutter/material.dart';
import 'package:echanyoba/screens/home_screen.dart';


class DetailContact extends StatelessWidget {
  static const String id = 'DetailContact';

  const DetailContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch arguments from HomePage
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (arguments == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Detail Contact',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('No contact details provided.'),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Detail Contact',
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            // Header Image
            Center(
              child: Image.asset(
                'assets/images/Icondetail.png', // Replace with your image path
                height: 200,
              ),
            ),
            const SizedBox(height: 15),

            // Name Field
            _ContactDetailField(
              label: 'Name',
              value: arguments['name'] ?? 'Unknown',
              icon: Icons.person,
            ),
            const SizedBox(height: 10),

            // Email Field
            _ContactDetailField(
              label: 'Email',
              value: arguments['name'] != null
                  ? '${arguments['name']!.replaceAll(' ', '').toLowerCase()}@gmail.com'
                  : 'Unknown',
              icon: Icons.email,
            ),
            const SizedBox(height: 10),

            // Phone Number Field
            _ContactDetailField(
              label: 'Phone Number',
              value: arguments['phone'] ?? 'Unknown',
              icon: Icons.phone,
            ),
            const SizedBox(height: 10),

            // Note Field
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Note',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Send Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactDetailField extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _ContactDetailField({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
