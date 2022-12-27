
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Alter_Dialog.dart';


class login extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=>loginState();
}

final _formKey = GlobalKey<FormState>();

class loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    String _password = '';
    String _email = '';



    registration() async {


      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        //showAlertDialog(context,"Error",e.toString());
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'login',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(                   // Email text field
                /*   validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },

                onSaved: (value) => _email = value?.trim() ?? '',*/
                obscureText: false,
                controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: 'Your email address',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: null,
              ),
              SizedBox(height: 20.0),
              /*
              * password Textfiled
              * */
              TextFormField(
                controller: passwordcontroller,
                obscureText: false,
                /* validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value?.trim() ?? '',*/
                decoration: InputDecoration(
                  labelText: 'password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: null,
              ),
              SizedBox(height: 20.0),


              SizedBox(
                height: 40, //height of button
                width: 150, //width of button
                child: ElevatedButton(
                  onPressed: () {
                    if(_email==''&& _password=='')
                    {
                      showAlertDialog(context,"Error","field Empty");
                    }
                    else if(_email=='')
                    {
                      showAlertDialog(context,"Error","Email Error");
                    }
                    else if(_password=='')
                    {
                      showAlertDialog(context,"Error","password Error");
                    }

                    if (_formKey.currentState!.validate()) {
                      _email = emailcontroller.text;
                      _password = passwordcontroller.text;
                    }
                    registration();

                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}