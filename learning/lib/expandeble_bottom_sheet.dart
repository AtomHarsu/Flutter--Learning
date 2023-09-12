import 'package:flutter/material.dart';

class ExpandebleWidgetBottomSheet extends StatefulWidget {
  const ExpandebleWidgetBottomSheet({super.key});

  @override
  State<ExpandebleWidgetBottomSheet> createState() =>
      _ExpandebleWidgetBottomSheetState();
}

class _ExpandebleWidgetBottomSheetState
    extends State<ExpandebleWidgetBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              openChangeUserDetailsBottomSheet(context);
            },
            child: Text(' child')),
      ],
    ));
  }
}

openChangeUserDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                  ],
                ),
              ),
            ),
          ],
        );
      });
}
