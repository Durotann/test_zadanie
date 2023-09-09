import 'package:flutter/material.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Заказ оплачен",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 94,
              height: 94,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                "images/final.png",
                scale: 3,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Ваш заказ принят в работу",
              style: const TextStyle(
                fontFamily: "SF Pro Display",
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                height: 26 / 22,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Подтверждение заказа №104893 может \nзанять некоторое время (от 1 часа до суток).\n Как только мы получим ответ от\n туроператора, вам на почту придет\n уведомление.",
              style: const TextStyle(
                fontFamily: "SF Pro Display",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff828796),
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
