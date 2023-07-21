import 'package:flutter/material.dart';
import 'package:learning/creat/file_provider.dart';
import 'package:provider/provider.dart';

class UiScreen extends StatefulWidget {
  const UiScreen({super.key});

  @override
  State<UiScreen> createState() => _UiScreenState();
}

FileProvider? fileProvider;

class _UiScreenState extends State<UiScreen> {
  @override
  void initState() {
    fileProvider = Provider.of<FileProvider>(context, listen: false);
    // TODO: implement initState
    getDat();
    super.initState();
  }

  getDat() async {
    fileProvider!.isLoading = true;
    setState(() {});
    await fileProvider!.getData();
    fileProvider!.isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Project'),
      ),
      body: fileProvider!.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: List.generate(fileProvider!.getList.length,
                            (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 190,
                          width: double.infinity,
                          color: Colors.cyan,
                          child: Column(
                            children: [
                              Text(fileProvider!.getList[index].assignedRoute ??
                                  ''),
                              Text(fileProvider!.getList[index].created ?? ''),
                              Text(
                                  fileProvider!.getList[index].createdBy ?? ''),
                              Text(fileProvider!
                                      .getList[index].registerednumber ??
                                  ''),
                              Text(fileProvider!.getList[index].seating ?? ''),
                              Text(fileProvider!.getList[index].status ?? ''),
                              Text(fileProvider!.getList[index]
                                      .trackingDeviceIdentifier ??
                                  ''),
                              Text(fileProvider!.getList[index].updated ?? ''),
                              Text(
                                  fileProvider!.getList[index].updatedBy ?? ''),
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
