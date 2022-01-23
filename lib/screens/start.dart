import 'package:flutter/material.dart';
import 'dart:io';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff05223B),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 120,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/noted.jpg'),
            Text(
              'Plan Easy',
              style: TextStyle(
                color: Color(0xff7DD8FF),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff00314D),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff05B1A1), width: 1.2),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'signin');
                },
                child: Text('START'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff00314D),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffC51A1A), width: 1.2),
              ),
              child: TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text('EXIT'),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            //Setting button

            Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff00314D),
                border: Border.all(color: Color(0xff946FB9), width: 1.2),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'info');
                },
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.indigo[200],
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
