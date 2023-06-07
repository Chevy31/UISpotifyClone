import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modul1/layout/register.dart';
import 'package:modul1/layout/home.dart';

class emailLogin extends StatefulWidget{
  const emailLogin({Key? key}) : super(key: key);
  @override
  screenemail createState() => screenemail();
}
class screenemail extends State<emailLogin>{
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.withOpacity(0.6),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.2),
              ],
              begin: Alignment.topCenter,
            )),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 12,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(height: 70),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            Material(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              elevation: 2,
                              child: AspectRatio(
                                aspectRatio: 7 / 1,
                                child: Center(
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Email",
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(8),
                                    ),
                                    onChanged: (value){
                                      _email = value.trim();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Material(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                elevation: 2,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 7 / 1,
                                          child: Center(
                                            child: TextFormField(
                                              style: TextStyle(color: Colors.black),
                                              controller: passwordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                hintText: "Enter Password",
                                                hintStyle:
                                                TextStyle(color: Colors.black),
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.all(8),
                                              ),
                                              onChanged: (value){
                                                _password = value.trim();
                                              },
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: MediaQuery.of(context).size.width,
                              child: MaterialButton(
                                onPressed: () async {
                                  auth.signInWithEmailAndPassword(
                                      email: _email,
                                      password: _password
                                  );
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) => navBar()
                                      )
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                color: Color(0xFFFF7043),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                                padding: EdgeInsets.all(16),
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () async {
                                final result = await Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => navBar())
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),InkWell(
                              onTap: ()async{
                                final result = await Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => register())
                                );
                              },
                              child: Text(
                                "\nCreate New Account",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }

}