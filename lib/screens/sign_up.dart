import 'package:flutter/material.dart';
import 'package:flutter_project/services/dao.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDAO userDAO = UserDAO();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  color: Color(0xff00314D),
                  height: 200,
                  child: Container(
                    margin: EdgeInsets.only(left: 25, bottom: 20),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7DD8FF)),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xff03A4FF),
                  height: 2,
                  thickness: 2,
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      color: Color(0xff00253A),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: usernameController,
                              validator: (val) => val!.isEmpty
                                  ? 'Username can\'t be empty'
                                  : null,
                              style: TextStyle(
                                color: Color(0xff7DD8FF),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Color(0xff7DD8FF)),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(0xff03A4FF),
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Color(0xff03A4FF),
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Color(0xff03A4FF),
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Color(0xff03A4FF),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (val) => val!.isEmpty
                                  ? 'Password can\'t be empty'
                                  : null,
                              style: TextStyle(
                                color: Color(0xff7DD8FF),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Color(0xff7DD8FF)),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(0xff03A4FF),
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(0xff03A4FF),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(0xff03A4FF),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff03A4FF),
                                  ),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Color(0xff103A4FF),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, 'signin');
                                    },
                                    child: Text(
                                      'Back to Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(child: SizedBox.shrink()),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: SizedBox.shrink()),
                                Container(
                                  height: 35,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Color(0xff103A4FF),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        int res = await userDAO.register(
                                            usernameController.text,
                                            passwordController.text);
                                        if (res == 1) {
                                          Navigator.pushReplacementNamed(
                                              context, 'signin');
                                        } else {
                                          print('error register');
                                        }
                                      } else {
                                        print('error credentials');
                                      }
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
