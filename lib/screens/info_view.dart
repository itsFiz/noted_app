import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key, this.index, this.data}) : super(key: key);

  final int? index;
  final Map? data;

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
                      icon:
                          Icon(Icons.arrow_back_ios, color: Color(0xff7DD8FF)),
                    ),
                    Expanded(
                      child: Text(
                        data!['title'],
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
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                color: Color(0xff00253A),
                child: Center(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          index == 2
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Image.asset(
                                    'assets/team.png',
                                    width: 160,
                                    height: 160,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                      Text(
                        data!['content'],
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff7DD8FF), fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          'assets/icons/notedlogoo.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Text(
                        '© 2022 NOTED TEAM FROM SKR4307-4 \n (TS. DR. NURUL AMELINA)',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff7DD8FF), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
