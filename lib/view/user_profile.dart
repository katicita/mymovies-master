import 'package:flutter/material.dart';

///Widget con los perfiles de usuario
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("User Profile",
                          style: Theme.of(context).textTheme.headline4)),
                ),
                SizedBox(height: 15),
                Stack(children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 70,
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 65.0,
                      backgroundImage: AssetImage('assets/user_icon.png'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20.0,
                          child: Icon(
                            Icons.camera_alt,
                            size: 25.0,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'First Name',
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    // labelText: 'Last Name',
                    hintText: 'Last Name',
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 15),
                UpdateButton(onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  final VoidCallback onPressed;

  UpdateButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: onPressed,
      child: Text("Update Data"),
    );
  }
}
