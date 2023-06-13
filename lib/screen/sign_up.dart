import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screen/slider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = FirebaseAuth.instance;
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    final password2Controller = TextEditingController();
    return Scaffold(
      body: StreamBuilder(
         stream: authService.authStateChanges(),
          builder: (_, snapshot) => !snapshot.hasData
              ?
         Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:const Icon(
                          Icons.arrow_back_ios,
                          size: 45,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 350,
                      height: 380,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                      const    SizedBox(height: 20,),
                          Container(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextFormField(
                                  controller: mailController,
                                  decoration: InputDecoration(
                                    prefixIcon:const Icon(Icons.person),
                                    hintText: 'Email',
                                    fillColor: const Color.fromARGB(135, 137, 218, 209),
                                    filled: true,
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                230, 137, 218, 209))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                135, 137, 218, 209))),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    prefixIcon:const Icon(Icons.person),
                                    hintText: 'Password',
                                    fillColor:const Color.fromARGB(135, 137, 218, 209),
                                    filled: true,
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                230, 137, 218, 209))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                135, 137, 218, 209))),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                TextFormField(
                                  controller: password2Controller,
                                  decoration: InputDecoration(
                                    prefixIcon:const Icon(Icons.person),
                                    hintText: 'Repet password',
                                    fillColor:const Color.fromARGB(135, 137, 218, 209),
                                    filled: true,
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                230, 137, 218, 209))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                135, 137, 218, 209))),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                
                                Container(
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
                                          color: Color.fromARGB(199, 0, 0, 0),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22),
                                    ),
                                    onPressed: () async {
                                      
                                     await authService.createUserWithEmailAndPassword(
                                        email: mailController.text.trim(), 
                                        password: passwordController.text.trim());
                                        try {
                                                   authService
                                                    .signInWithEmailAndPassword(
                                                        email: mailController.text
                                                            .trim(),
                                                        password:
                                                            passwordController
                                                                .text
                                                                .trim());
                                                } catch (e) {
                                                  print(e);
                                                }
                                    },
                                  ),
                                ),
            
                                // ),
                              ],
                            ),
                            
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:const [
                              Text('Forgot your password?'),
                            ],
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  )
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
        ): CarouselWithIndicatorDemo()
      ),
    );
  }
}
