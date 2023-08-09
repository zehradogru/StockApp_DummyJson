import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../buttons/navi_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String passwordTxt = '';
  String usernameTxt = '';

  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  Future<String> login(String usernameTxt, String passwordTxt) async {
    print('girdi');

    var res = await http.get(Uri.parse("https://dummyjson.com/users"));

    if (res.statusCode == 200) {
      final data = json.decode(res.body);

      final List<dynamic> mylist = data["users"];

      List<Map<String, String>> userMapList = [];

      for (var user in data['users']) {
        if (user.containsKey('username') && user.containsKey('password')) {
          userMapList.add({
            'username': user['username'],
            'password': user['password'],
          });
        }
      }

      for (int i = 0; i < mylist.length; i++) {
        if (mylist[i]['username'] == usernameTxt &&
            mylist[i]['password'] == passwordTxt) {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NaviBar()),
          );
          return 'Success';
        } else {
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('ERROR'),
                content: const Text('Wrong username or password.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contect) => const LoginPage()),
                      );
                    },
                    child: const Text('Okey'),
                  ),
                ],
              );
            },
          );
        }
      }
    }
    return 'dsdfsasdsa';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 59,
              width: 310,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    usernameTxt = text;
                  });
                },
                decoration: const InputDecoration(
                    hintText: 'Username',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 59,
              width: 310,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    passwordTxt = text;
                  });
                },
                decoration: InputDecoration(

                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        togglePasswordVisibility();
                      },
                    ),
                    hintText: 'Password',
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)

                    )

                ),



                obscureText: isPasswordHidden,

              ),

            ),

            const SizedBox(height: 20),
            SizedBox(
              height: 59,
              width: 310,
              child: ElevatedButton(
                onPressed: () {
                  //if ekle

                  login(usernameTxt, passwordTxt);

                  /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NaviBar()),
                      );*/
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shadowColor: Colors.black.withOpacity(1),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(width: 60),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(width: 90),
              ],
            )
          ]))),
    );
  }
}
