import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneNumber = ''.obs;

  void onPhoneNumberChanged(String value) {
    phoneNumber.value = value;
  }

  void onContinue() {
    if (phoneNumber.value.isEmpty || phoneNumber.value.length < 10) {
      Get.snackbar(
        'Error',
        'Please enter a valid phone number',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Handle navigation or API call here
      Get.snackbar(
        'Success',
        'Phone number: ${phoneNumber.value}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your registered phone number to log in',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: '+62 ',
                labelText: 'Phone number',
                border: OutlineInputBorder(),
              ),
              onChanged: controller.onPhoneNumberChanged,
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Handle "Issue with number?" tap
                Get.snackbar(
                  'Help',
                  'Redirecting to support page...',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text(
                'Issue with number?',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}
