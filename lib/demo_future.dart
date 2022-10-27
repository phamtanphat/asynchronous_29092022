import 'package:flutter/material.dart';
class DemoFuturePage extends StatefulWidget {

  @override
  State<DemoFuturePage> createState() => _DemoFuturePageState();
}

class _DemoFuturePageState extends State<DemoFuturePage> {

  @override
  void didUpdateWidget(covariant DemoFuturePage oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 1: Delay
    Future.delayed(Duration(seconds: 1), (){
      showMessageDialog("Đã đợi sau 1s");
    });
  }

  void showMessageDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Future"),
      ),
      body: Container(),
    );
  }
}
