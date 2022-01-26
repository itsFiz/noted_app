import 'package:flutter/material.dart';
import 'package:flutter_project/models/noted.dart';
import 'package:flutter_project/services/dao.dart';
import 'package:intl/intl.dart';

class ViewNoted extends StatefulWidget {
  const ViewNoted({Key? key}) : super(key: key);

  @override
  _ViewNotedState createState() => _ViewNotedState();
}

class _ViewNotedState extends State<ViewNoted> {
  List<Noted> data = [];
  UserDAO userDAO = UserDAO();

  setData(String username, String subject) async {
    dynamic res = await userDAO.getNoteds(username, subject);
    setState(() {
      data = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    String username = '';
    String subject = '';
    Map s = ModalRoute.of(context)!.settings.arguments as Map;
    if (s.isNotEmpty) {
      username = s['username'];
      subject = s['subject'];
    }

    setData(username, subject);

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
                        subject,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7DD8FF)),
                      ),
                    ),
                    SizedBox(width: 50),
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
                padding: EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Noted List',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xff7DD8FF),
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                          itemCount: data.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return InkWell(
                                  onTap: () {
                                    TextEditingController nameController =
                                        TextEditingController();
                                    TextEditingController dueController =
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Form(
                                          key: _formKey,
                                          child: Container(
                                            color: Colors.transparent,
                                            height: 300,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 35),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Add new Noted',
                                                  style: TextStyle(
                                                    color: Color(0xff7DD8FF),
                                                    fontSize: 22,
                                                  ),
                                                ),
                                                TextFormField(
                                                  style: TextStyle(
                                                      color: Color(0xff7DD8FF)),
                                                  controller: nameController,
                                                  validator: (val) => val!
                                                          .isEmpty
                                                      ? 'Name can\'t be empty'
                                                      : null,
                                                  decoration: InputDecoration(
                                                    hintText: 'Name',
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Color(0xff7DD8FF)),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xff03A4FF)),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xff03A4FF)),
                                                    ),
                                                    disabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xff03A4FF)),
                                                    ),
                                                  ),
                                                ),
                                                TextFormField(
                                                  style: TextStyle(
                                                      color: Color(0xff7DD8FF)),
                                                  controller: dueController,
                                                  validator: (val) => val!
                                                          .isEmpty
                                                      ? 'Due can\'t be empty'
                                                      : null,
                                                  decoration: InputDecoration(
                                                    hintText: 'Due Date',
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Color(0xff7DD8FF)),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xff03A4FF)),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xff03A4FF)),
                                                    ),
                                                    disabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xff03A4FF)),
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
                                                              BorderRadius
                                                                  .circular(5),
                                                        ))),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
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
                                                                      .circular(
                                                                          5),
                                                            ))),
                                                        onPressed: () async {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            Noted noted = Noted(
                                                                nameController
                                                                    .text,
                                                                dueController
                                                                    .text);
                                                            await userDAO
                                                                .insertNoteds(
                                                                    username,
                                                                    subject,
                                                                    noted);
                                                            Navigator.pop(
                                                                context);
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
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 45,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Color(0xff00314D),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Center(
                                      child: Text(
                                        'Add new Noted',
                                        style:
                                            TextStyle(color: Color(0xff7DD8FF)),
                                      ),
                                    ),
                                  ));
                            }
                            return Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Color(0xff00314D),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Color(0xff03A4FF),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          data.elementAt(index - 1).name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff044468),
                                        ),
                                        child: Text(
                                          data.elementAt(index - 1).due,
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withAlpha(150)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) => Dialog(
                                                      backgroundColor:
                                                          Color(0xff00253A),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: BorderSide(
                                                          color:
                                                              Color(0xff03A4FF),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Container(
                                                        height: 100,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              'Are you sure want to delete?',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff7DD8FF),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                TextButton(
                                                                    style:
                                                                        ButtonStyle(
                                                                            shape: MaterialStateProperty.all(
                                                                                RoundedRectangleBorder(
                                                                      side: BorderSide(
                                                                          color:
                                                                              Color(0xff03A4FF)),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ))),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                        'Cancel')),
                                                                SizedBox(
                                                                    width: 10),
                                                                TextButton(
                                                                    style:
                                                                        ButtonStyle(
                                                                            backgroundColor: MaterialStateProperty.all(Color(
                                                                                0xff03A4FF)),
                                                                            shape: MaterialStateProperty.all(
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ))),
                                                                    onPressed:
                                                                        () async {
                                                                      await userDAO.deleteNoted(
                                                                          username,
                                                                          subject,
                                                                          data
                                                                              .elementAt(index - 1)
                                                                              .name);
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                      'Delete',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Color(0xff00253A)),
                                                                    )),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ));
                                          },
                                          icon: Icon(
                                            Icons.cancel_outlined,
                                            color: Color(0xff7DD8FF),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
