import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetProductIteamApi extends StatefulWidget {
  const GetProductIteamApi({super.key});

  @override
  State<GetProductIteamApi> createState() => _GetProductIteamApiState();
}

class _GetProductIteamApiState extends State<GetProductIteamApi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  bool isLoading = false;

  getData() async {
    isLoading == true;
    setState(() {});
    print('set 1');
    await get_product_income();
    isLoading == false;
    setState(() {});
    print('set 2');
  }

  int? dd;
  int? direct;
  int? cashback;
  int? team;
  String? walletBalance;
  String? utilityamount;
  Future<void> get_product_income() async {
    try {
      final response = await post(
        Uri.parse('https://alkanir.com/app/v1/api/get_products_incomes'),
        body: {'product_id': '1503'},
      );
      var statusCode = response.statusCode;
      var data = json.decode(response.body.toString());

      if (statusCode == 200) {
        print('data ::: ${data}');
        dd = data['data']['dd'];
        direct = data['data']['direct'];
        cashback = data['data']['cashback'];
        team = data['data']['team'];
        walletBalance = data['data']['wallet_used'];
        utilityamount = data['data']['utility_amount'];
        print('dd :::::${dd}');
      }
    } catch (e) {
      print('e:::${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.yellow[300]),
                    child: Center(
                      child: Text('Wallet Deduction Rs. ${walletBalance}'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.green[400]),
                    child: Center(
                      child:
                          Text('Hurry! Cashback You can get Rs. ${cashback}'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.cyan[400]),
                    child: Center(
                      child: Text(
                          'Get Utility Wallet Balance Rs. ${utilityamount}'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'How much User Can Earn From This ?',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Your Cashback Rs. ${cashback}'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Digital Distributor Rs. ${dd}'),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Team Sales Income(Level Wise) Rs. ${team}'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Direct Income  Rs. ${direct}'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
