import 'package:flutter/material.dart';
import 'package:learning/dr/data_provider.dart';
import 'package:provider/provider.dart';

class UiScreen1 extends StatefulWidget {
  const UiScreen1({super.key});

  @override
  State<UiScreen1> createState() => _UiScreen1State();
}

DataProvider? dataProvider;

class _UiScreen1State extends State<UiScreen1> {
  @override
  void initState() {
    dataProvider = Provider.of<DataProvider>(context, listen: false);
    // TODO: implement initState
    getDat();
    super.initState();
  }

  getDat() async {
    dataProvider!.isLoading = true;
    setState(() {});
    await dataProvider!.getData();
    dataProvider!.isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Project'),
      ),
      body: dataProvider!.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: List.generate(dataProvider!.getList.length,
                            (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          color: Colors.cyan,
                          child: Column(
                            children: [
                              Text(dataProvider!
                                      .getList[index].assignedBusDisplayName ??
                                  ''),
                              Text(
                                  dataProvider!.getList[index].assignedBusRef ??
                                      ''),
                              Text(dataProvider!.getList[index]
                                      .assignedRouteDisplayName ??
                                  ''),
                              Text(dataProvider!
                                      .getList[index].assignedRouteRef ??
                                  ''),
                              Text(dataProvider!.getList[index].email ?? ''),
                              Text(dataProvider!.getList[index].identifier ??
                                  ''),
                              Text(
                                  dataProvider!.getList[index].licenseBackUrl ??
                                      ''),
                              Text(dataProvider!
                                      .getList[index].licenseFrontUrl ??
                                  ''),
                              Text(dataProvider!.getList[index].name ?? ''),
                              Text(dataProvider!.getList[index].phone ?? ''),
                              Text(dataProvider!.getList[index].profileUrl ??
                                  ''),
                              Text(dataProvider!.getList[index].status ?? ''),
                            ],
                          ),
                        ),
                      );
                    })),
                  )
                ],
              ),
            ),
    );
  }
}
