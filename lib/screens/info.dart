import 'package:flutter/material.dart';
import 'package:flutter_project/constant/constant.dart';
import 'package:flutter_project/screens/info_view.dart';

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
          Expanded(
            child: Container(
              color: Color(0xff00253A),
              child: Column(
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff00314D),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff7DD8FF), width: 1.2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoView(
                                      index: 0,
                                      data: Constant.info[0],
                                    )));
                      },
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(color: Color(0xff7DD8FF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff00314D),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff7DD8FF), width: 1.2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoView(
                                      index: 1,
                                      data: Constant.info[1],
                                    )));
                      },
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(color: Color(0xff7DD8FF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff00314D),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff7DD8FF), width: 1.2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoView(
                                      index: 2,
                                      data: Constant.info[2],
                                    )));
                      },
                      child: Text(
                        'About Us',
                        style: TextStyle(color: Color(0xff7DD8FF)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
