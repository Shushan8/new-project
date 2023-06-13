import 'package:flutter/material.dart';
import 'package:new_project/screen/sign_in.dart';
import 'package:new_project/screen/sign_up.dart';

class SignInUp extends StatelessWidget {
  const SignInUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 620,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 350,
                  height: 390,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'assetc/images/images.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                              color: Color.fromARGB(255, 137, 218, 208)),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            shape: const StadiumBorder(),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>const SignIn()));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                              color: Color.fromARGB(135, 137, 218, 209)),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            shape: const StadiumBorder(),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Color.fromARGB(199, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>const SignUp()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(children: <Widget>[
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: const Divider(
                    color: Colors.black,
                    height: 40,
                  )),
            ),
            const Text("OR"),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: const Divider(
                    color: Colors.black,
                    height: 39,
                  )),
            ),
          ]),
          Row(
            children: [
              SizedBox(
                  width: 181,
                  child: Image.asset(
                    'assetc/images/images.png',
                  )),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Image.asset('assetc/images/fb.png'),
                  ),
                  SizedBox(
                    width: 50,
                    child: Image.asset('assetc/images/gp.png'),
                  ),
                  SizedBox(
                    width: 50,
                    child: Image.asset('assetc/images/tw.png'),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
