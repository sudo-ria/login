import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();

}

class _LoginSignupPageState extends State<LoginSignupPage> {
//123

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter login demo'),
      ),
      body: showForm(),
    );
  }

  Widget showForm() {
    class _FormValidationState extends State<FormValidation> {
    String _email;
    String _password;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
    TextFormField(
    key: _formKey,
    autovalidate: _autoValidate,
    decoration: const InputDecoration(
    icon: Icon(Icons.mail),
    hintText: 'Enter your email',
    labelText: 'Email *',
    ),
    validator: (String value) {
    return value.contains('@') ? 'Do not use the @ char.' : null;
    },
    onSaved: (String value) {
    _email = val;
    },

    ),
    TextFormField(
    decoration: const InputDecoration(
    icon: Icon(Icons.lock),
    hintText: 'Enter your password',
    labelText: 'Password *',
    ),
    validator: (String value) {
    if(value.isEmpty){
    return 'Password is required';
    }
    },
    onSaved: (String value){
    _password=value;
    }
    ),

    _buildEmail(),
    _buildPassword(),

    RaisedButton(
    onPressed: (_){
    if(!_formKey.currentState.validate()) {
    return;
    }
    _formKey.currentState.save();
    print(_email);
    print(_password);
    },
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(30.0)),
    color: Colors.blue,
    child: new Text( 'Login'),
    style: new TextStyle(fontSize: 20.0, color: Colors.white),
    )
    ) ]
    );
    }
  }
}
