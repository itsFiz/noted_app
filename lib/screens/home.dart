import 'package:flutter/material.dart';
import 'package:flutter_project/services/dao.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> data = [];
  UserDAO userDAO = UserDAO();

  setData(String username) async {
    dynamic res = await userDAO.getSubjects(username);
    setState(() {
      data = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    String username = '';
    Map s = ModalRoute.of(context)!.settings.arguments as Map;
    if (s.isNotEmpty) {
      username = s['username'];
    }

    setData(username);

    final dateTime = DateTime.now();

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
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, $username',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7DD8FF)),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(dateTime),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7DD8FF)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'signin');
                          },
                          icon: Icon(
                            Icons.logout_outlined,
                            color: Color(0xff7DD8FF),
                          )),
                    )
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
                padding: EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                ),
                color: Color(0xff00253A),
                child: GridView.builder(
                  itemCount: data.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    if (index == data.length) {
                      return InkWell(
                        onTap: () {
                          TextEditingController controller =
                              TextEditingController();
                          GlobalKey<FormState> _formKey =
                              GlobalKey<FormState>();
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    backgroundColor: Color(0xff00253A),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Color(0xff03A4FF),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Form(
                                      key: _formKey,
                                      child: Container(
                                        color: Colors.transparent,
                                        height: 200,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 35),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Add new subject',
                                              style: TextStyle(
                                                color: Color(0xff7DD8FF),
                                                fontSize: 22,
                                              ),
                                            ),
                                            TextFormField(
                                              style: TextStyle(
                                                  color: Color(0xff7DD8FF)),
                                              controller: controller,
                                              validator: (val) =>
                                                  (val!.isEmpty || val == null)
                                                      ? 'Name can\'t be empty!'
                                                      : null,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff03A4FF)),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff03A4FF)),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff03A4FF)),
                                                ),
                                                disabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff03A4FF)),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty
                                                            .all(
                                                                RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Color(
                                                              0xff03A4FF)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ))),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Cancel')),
                                                SizedBox(width: 10),
                                                TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Color(
                                                                    0xff03A4FF)),
                                                        shape: MaterialStateProperty
                                                            .all(
                                                                RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ))),
                                                    onPressed: () async {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        await userDAO
                                                            .insertSubject(
                                                                username,
                                                                controller
                                                                    .text);
                                                        Navigator.pop(context);
                                                      } else {
                                                        print('error name');
                                                      }
                                                    },
                                                    child: Text(
                                                      'Add',
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff00253A)),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        },
                        child: Container(
                          color: Color(0xff017FCC),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/addbutton.png',
                              width: 30,
                            ),
                          ),
                        ),
                      );
                    }

                    return InkWell(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  backgroundColor: Color(0xff00253A),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Color(0xff03A4FF),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Are you sure want to delete?',
                                          style: TextStyle(
                                            color: Color(0xff7DD8FF),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Color(0xff03A4FF)),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ))),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel')),
                                            SizedBox(width: 10),
                                            TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Color(
                                                                0xff03A4FF)),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ))),
                                                onPressed: () async {
                                                  await userDAO.deleteSubject(
                                                      username,
                                                      data.elementAt(
                                                          index)['subject']);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      color: Color(0xff00253A)),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      onTap: () {
                        Navigator.pushNamed(context, 'viewnoted', arguments: {
                          'username': username,
                          'subject': data.elementAt(index)['subject']
                        });
                      },
                      child: Container(
                        color: Color(0xff00314D),
                        child: Center(
                          child: Text(
                            data.elementAt(index)['subject'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
