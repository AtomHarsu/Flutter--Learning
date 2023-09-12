import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserIncome extends StatefulWidget {
  const UserIncome({super.key});

  @override
  State<UserIncome> createState() => _UserIncomeState();
}

class _UserIncomeState extends State<UserIncome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_product_income();
  }
  //variable for the confirm

  String? teamC;
  String? cashbackC;
  String? ddC;
  String? dsiC;

  // variable for the aprox

  String? teamA;
  String? cashbackA;
  String? ddA;
  String? dsiA;

  //varaible for the payouts

  String? pending;
  String? processing;
  String? processed;
  String? failed;
  String? pendtdsing;

  //varaiable for the payouts

  String? pendingP;
  String? processingP;
  String? processedgP;
  String? failedP;
  String? tdsP;

  //varaiable for the wallet balance

  String? walletbalance;

  //variable for the utility wallet amount

  String? utilitwallet;

  Future<void> get_product_income() async {
    try {
      final response = await post(
        Uri.parse('https://alkanir.com/app/v1/api/get_user_incomes'),
        body: {'user_id': '1503'},
      );
      var statusCode = response.statusCode;
      var data = json.decode(response.body.toString());

      if (statusCode == 200) {
        print('data :::: $data');
        //variable for the confirm
        teamC = data['data']['confirm']['team'];
        cashbackC = data['data']['confirm']['cashback'];
        ddC = data['data']['confirm']['dd'];
        dsiC = data['data']['confirm']['dsi'];

        // variable for the aprox
        teamA = data['data']['approx']['team'];
        cashbackA = data['data']['approx']['cashback'];
        ddA = data['data']['approx']['dd'];
        dsiA = data['data']['approx']['dsi'];

        //variable for the payouts

        pendingP = data['data']['payout']['pending'];
        processingP = data['data']['payout']['processing'];
        processedgP = data['data']['payout']['processed'];
        failedP = data['data']['payout']['failed'];
        tdsP = data['data']['payout']['tds'];

        //varaiable for the wallet balance

        walletbalance = data['data']['wallet_amount'];
        print('$walletbalance');
        //variable for the utility wallet amount

        utilitwallet = data['data']['utilit_wallet'];
        print('$utilitwallet');
      }
    } catch (e) {
      print('e:::${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text('Earning'),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Refwrral(Discount) Wallet'),
                        Text('Rs ${walletbalance}')
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Utility Wallet Amount'),
                        Text('Rs ${utilitwallet}')
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('CashBack Income'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Approx'),
                                Text('Rs ${cashbackA}'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Confirmed'),
                                Text('Rs ${cashbackC}'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Direct Sales Income'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Approx'),
                                Text('Rs ${dsiA}'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Confirmed'),
                                Text('Rs ${dsiC}'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Team Sales Income(Level wise)'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Approx'),
                                Text('Rs ${teamA}'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Confirmed'),
                                Text('Rs ${teamC}'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Digital Distributor Income'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Approx'),
                                Text('Rs ${ddA}'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Confirmed'),
                                Text('Rs ${ddC}'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(child: Text('Payouts'))),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pending Payouts'),
                        Text('Rs ${pendingP}'),
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Proccessing Payouts'),
                        Text('Rs ${processingP}'),
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Credited Payouts Till Date'),
                        Text('Rs ${processedgP}'),
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total TDS Deduction Till Date'),
                        Text('Rs ${tdsP}'),
                      ],
                    ),
                    Divider(thickness: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Failed Payouts'),
                        Text('Rs ${failedP}'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
