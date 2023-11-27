import 'dart:convert';
import 'dart:io';

import 'package:delete_all_widget_demo/app/common/pay_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:pay/pay.dart';
import 'package:upi_india/upi_india.dart';

class PayMentIntigration extends StatefulWidget {
  const PayMentIntigration({Key? key}) : super(key: key);

  @override
  State<PayMentIntigration> createState() => _PayMentIntigrationState();
}

class _PayMentIntigrationState extends State<PayMentIntigration> {
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp> apps = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
        apps = value;
        setState(() {});
      }).catchError((e) {
        apps = [];
        setState(() {});
      });
    });
  }

  bool os = Platform.isAndroid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Intigration"),
      ),
      body: Column(
        children: [
          if (apps.isNotEmpty)
            Wrap(children: [
              ...List.generate(
                  apps.length,
                  (index) => ElevatedButton(
                      onPressed: () {
                        initiateUpiPayment(apps[index]);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.memory(
                            apps[index].icon,
                            height: 50,
                            width: 50,
                          ),
                          Text("${apps[index].name}"),
                        ],
                      )))
            ]),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              GooglePayButton(
                paymentConfiguration:
                    PaymentConfiguration.fromJsonString(defaultGooglePay),
                paymentItems: [
                  PaymentItem(
                      amount: "0.1",
                      label: "Total",
                      status: PaymentItemStatus.final_price)
                ],
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (result) {
                  print("result---$result");
                },
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  ///gpay

  Future<void> initiateUpiPayment(UpiApp app) async {
    // Set the UPI parameters
    UpiResponse response = await _upiIndia.startTransaction(
      app: app,
      receiverUpiId: '9512829152@apl', // Replace with the receiver's UPI ID
      receiverName: 'kundan dhami',
      transactionRefId:
          'TXN123456789', // Replace with your unique transaction ID
      transactionNote: 'Test Payment',
      amount: 1.0, // Replace with the payment amount
    );

    print("response-----${response}");
    // Handle the UPI payment response
    if (response.status == UpiPaymentStatus.SUCCESS) {
      print('Payment successful111111111111111111111');
    } else if (response.status == UpiPaymentStatus.FAILURE) {
      print('Payment failed000000000000000000000000');
    } else if (response.status == UpiPaymentStatus.SUBMITTED) {
      print('Payment submitted111111111111111111111');
    } else {
      print('Payment canceled00000000000000000000');
    }
  }

  ///Stripe
  Map<String, dynamic>? paymentIntent;
  void makePayment() async {
    try {
      paymentIntent = await createPayment();
      var gPay = PaymentSheetGooglePay(
          merchantCountryCode: "IN", currencyCode: "IN", testEnv: true);
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent!['client_secret'],
            style: ThemeMode.dark,
            merchantDisplayName: "As",
            googlePay: gPay),
      );
      displayPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future createPayment() async {
    try {
      Map<String, dynamic> body = {'amount': "100", "currency": "IN"};

      final res = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Authorization": "Bearer token",
            "Content-Type": "application/x-www-form-urlencoded"
          });

      return jsonDecode(res.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
