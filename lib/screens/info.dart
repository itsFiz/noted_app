import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            color: Color(0xff00314D),
            height: 80,
            child: Container(
              margin: EdgeInsets.only(
                left: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Color(0xff7DD8FF)),
                  ),
                  Expanded(
                    child: Text(
                      'Info',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7DD8FF)),
                    ),
                  ),
                  SizedBox(width: 60),
                ],
              ),
            ),
          ),
          Divider(
            color: Color(0xff03A4FF),
            height: 2,
            thickness: 2,
          ),
        ],
      ),
    ));
  }
}
