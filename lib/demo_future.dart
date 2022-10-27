import 'dart:isolate';

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
    // Future.delayed(Duration(seconds: 1), (){
    //   showMessageDialog("Đã đợi sau 1s");
    // });

    // 2: Hứng kết quả future
    // var future = Future.delayed(Duration(seconds: 1), () {
    //   throw Exception("Lỗi");
    // });
    //
    // future
    //     .then((value) => showMessageDialog(value.toString()))
    //     .catchError((error) => showMessage(error.toString()));

    // 3: Sử dụng async await
    var resultFuture = Future.sync(() async {
      try {
        var value1 = await calculatePlus(5, 10);
        var value2 = await calculateMinus(value1, 10);
        return value2;
      } catch(e) {
        showMessage(e.toString());
      }
    });

    resultFuture
          .then((value) => showMessageDialog(value.toString()));
  }

  Future<int> calculatePlus(int a, int b) {
    return Future.value(a + b);
  }

  Future calculateMinus(int a, int b) {
    return Future.value(a - b);
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
