import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class pyament extends StatefulWidget {
  const pyament({super.key});

  @override
  State<pyament> createState() => _pyamentState();
}

class _pyamentState extends State<pyament> {
  Map<String,dynamic>?paymenIntentDat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: ()async{
await makePyament();
            },
  child:   Container(
    height:50 ,
    width: 200,
    decoration: BoxDecoration(
      
    ),
    child: Center(
      child: Text('Pye'),
    ),
  ),
)
        ],
      ),
    );
  }
  Future <void>makePyament()async{
    try{
paymenIntentDat = await cretePaymentInteNt('20','INR');
await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
  paymentIntentClientSecret:paymenIntentDat!['client_secret'],
  // applePay: true,
  // googlePay: true,
  style: ThemeMode.dark,
  merchantDisplayName: 'ASIF',
  
  
   ));

displayPamentShee();




    }catch(e){
      print('exaception'+e.toString());
    }
  }
displayPamentShee()async{
  try{
    Stripe.instance.presentPaymentSheet(
      options: PaymentSheetPresentOptions(

      ),

      // parameters: PresentPaymentSheetParameters(clientSecret:paymenIntentDat!['client_Secret'],
      
      // confirmPayment: true )
    );

  }catch(e){
    print(e.toString());
  }
}


cretePaymentInteNt(String amount, String currency)async{
  try{
    Map<String,dynamic> body= {
      //'amount':calculateAmount(amount),
      'currency':currency,
      'payment_method_types[]':'card'
    };
    var response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
    body:  body,
    headers: {
      
      'Authorization':'pk_test_51Nk9uNSD595mdAB3rWlkxYV0fXKJdAEa2raavSmyoLlgfmbOpb5k9Sqn1jbXq9eajWusqIVPb1zu5UGaubPe2YW300an5iGfXF',
      'Content-Type':'application/x-www-form-Urlencoded'
    }
    
    );
    return jsonDecode(response.body.toString());

    
  }catch(e){
       print('exaception'+e.toString());
    }

}
// calculateAmount(String amount){
//   final price = String.parse(amount)*100;
//   return price;
// }
}
