import 'package:flutter/material.dart';

class NewWidgetSetSnackBar extends StatelessWidget {
  const NewWidgetSetSnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      behavior: SnackBarBehavior.floating,
                      content: CustomSnackBar(
                          index: 0,
                          icon: Icons.check_circle_outline,
                          colors: Colors.green,
                          text: 'Welcome to The Flutter Community',
                          title: 'Hello!Flutter Dev'),
                    ),
                  );
                },
                child: const Text('Snackbar Success')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      behavior: SnackBarBehavior.floating,
                      content: CustomSnackBar(
                          index: 2,
                          icon: Icons.close,
                          colors: Colors.red,
                          text: 'Welcome to The Flutter Community',
                          title: 'Hello!Flutter Dev'),
                    ),
                  );
                },
                child: const Text('Snackbar Error')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      behavior: SnackBarBehavior.floating,
                      content: CustomSnackBar(
                          index: 1,
                          icon: Icons.report,
                          colors: Colors.orange,
                          text: 'Welcome to The Flutter Community',
                          title: 'Hello!Flutter Dev'),
                    ),
                  );
                },
                child: const Text('Snackbar Alert')),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomSnackBar extends StatelessWidget {
  String? title;
  String? text;
  Color? colors;
  IconData icon;
  int? index;

  CustomSnackBar(
      {super.key,
      required this.text,
      required this.title,
      required this.icon,
      required this.index,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 70,
          decoration: BoxDecoration(
            color: () {
              if (index == 0) {
                return Colors.green;
              } else if (index == 1) {
                return Colors.yellowAccent;
              } else if (index == 2) {
                return Colors.red;
              }
            }(),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: const TextStyle(
                          fontSize: 15, color: Colors.white, letterSpacing: 1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const Spacer(),
                    Text(
                      text!,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.white, letterSpacing: 1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 2,
          bottom: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: () {
              if (index == 0) {
                return const Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 50,
                );
              } else if (index == 1) {
                return const Icon(
                  Icons.warning,
                  color: Colors.yellow,
                  size: 50,
                );
              } else if (index == 2) {
                return const Icon(
                  Icons.dangerous,
                  color: Colors.red,
                  size: 50,
                );
              }
            }(),
          ),
        ),
      ],
    );
  }
}
