import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _validate = false;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                autovalidate: _validate,
                child: loginFormWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginFormWidget() {
    final _passwordField = TextFormField(
      decoration: const InputDecoration(labelText: '비밀번호'),
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: validatePassword,
      onSaved: (String val) {
        this._password = val;
      },
    );

    final _emailField = TextFormField(
      decoration: const InputDecoration(labelText: '이메일'),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String val) {
        this._email = val;
      },
    );

    return Column(
      children: <Widget>[
        _emailField,
        _passwordField,
        SizedBox(height: 10.0),
        RaisedButton(onPressed: _submit, child: Text('로그인'))
      ],
    );
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      // No any error in validation
      _formKey.currentState.save();
      print('$_email, $_password');
      Navigator.pushReplacementNamed(context, '/');
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  String validatePassword(String value) {
    if (value.length < 6)
      return 'Password must be more than 2 charater';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
