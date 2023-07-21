import 'package:flutter/material.dart';
import 'package:easy_upi_payment/easy_upi_payment.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            initiateUPIPayment('data', 9.0);
          },
          child: Text('Make UPI Payment'),
        ),
      ),
    );
  }

  void initiateUPIPayment(String payyeeVpa, double amount) async {
    try {
      final res = await EasyUpiPaymentPlatform.instance.startPayment(
        EasyUpiPaymentModel(
          payeeVpa: payyeeVpa,
          payeeName: 'Alkanir',
          amount: amount,
          description: 'Testing payment',
        ),
      );
      // TODO: add your success logic here
      print(res);
    } on EasyUpiPaymentException {
      print('message ${EasyUpiPaymentException}');
    } catch (e) {
      print(' error is casuing ${e.toString()}');
    }
  }
}
