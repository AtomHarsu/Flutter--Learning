import 'package:flutter/material.dart';

class EmailLoginForm extends StatefulWidget {
  @override
  _EmailLoginFormState createState() => _EmailLoginFormState();
}

class _EmailLoginFormState extends State<EmailLoginForm> {
  // Variable to store the email input
  String _email = '';

  // Variable to track whether the details are correct or not
  bool _areDetailsCorrect = false;

  // Function to check if the details are correct (you can modify this according to your authentication mechanism)
  bool _checkIfDetailsAreCorrect(String email) {
    // Perform your authentication check here
    // For example, you can check if the email matches a predefined value
    return email == 'harshgor399@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextFormField for email input
            TextFormField(
              onChanged: (value) {
                _email = value;
                _areDetailsCorrect = _checkIfDetailsAreCorrect(_email);
                setState(() {});
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: _email.isEmpty
                        ? Colors.grey
                        : _areDetailsCorrect
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: _email.isEmpty
                        ? Colors.grey
                        : _areDetailsCorrect
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: _email.isEmpty
                        ? Colors.grey
                        : _areDetailsCorrect
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: _email.isEmpty
                      ? Colors.grey
                      : _areDetailsCorrect
                          ? Colors.green
                          : Colors.red,
                ),
                // Wrap the content in a custom InputDecorator

                // Show an icon on the right side when the details are correct
                suffixIcon: _email.isEmpty
                    ? null
                    : _areDetailsCorrect
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : Icon(Icons.cancel, color: Colors.red),
                // Apply additional styles to the content inside InputDecorator
                // To align the icon on the right side of the text field
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            // Add other form fields and buttons as needed for the login process
          ],
        ),
      ),
    );
  }
}
