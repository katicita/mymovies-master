import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'dart:io';

///Pagina del Login.
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Form(
            child: ListView(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Image.asset('assets/user_icon.png', height: 200),
              ),
              SizedBox(height: 15),
              TextFormField(
                // controller: _emailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'User',
                ),
                // autovalidate: true,
                autocorrect: false,
              ),
              TextFormField(
                // controller: _passwordController,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Password',
                ),
                obscureText: true,
                // autovalidate: true,
                autocorrect: false,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LoginButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }),
                    GoogleLoginButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }),
                    FacebookLoginButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }),
                    Platform.isIOS
                        ? AppleLoginButton(onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          })
                        : Container(),
                    // CreateAccountButton(userRepository: _userRepository),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  LoginButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: onPressed,
      child: Text("Login"),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  GoogleLoginButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        primary: Colors.redAccent,
      ),
      icon: Icon(FontAwesomeIcons.google, color: Colors.white),
      onPressed: onPressed,
      label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
    );
  }
}

class FacebookLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  FacebookLoginButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        primary: Color(0xff3B569A),
      ),
      icon: Icon(FontAwesomeIcons.facebook, color: Colors.white),
      onPressed: onPressed,
      label:
          Text('Sign in with Facebook', style: TextStyle(color: Colors.white)),
    );
  }
}

class AppleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  AppleLoginButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        primary: Colors.black,
      ),
      icon: Icon(FontAwesomeIcons.apple, color: Colors.white),
      onPressed: onPressed,
      label: Text('Sign in with Apple', style: TextStyle(color: Colors.white)),
    );
  }
}
