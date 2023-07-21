import 'package:flutter/material.dart';

class CroulseSLider extends StatefulWidget {
  const CroulseSLider({super.key});

  @override
  State<CroulseSLider> createState() => _CroulseSLiderState();
}

class _CroulseSLiderState extends State<CroulseSLider> {
  List<String> pageList = [];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: [
          PageView.builder(
            itemCount: pageList.length,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Text('${i++}'),
              );
            },
          )
        ],
      ),
    );
  }
}
