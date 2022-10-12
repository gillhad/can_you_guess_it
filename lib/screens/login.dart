import 'package:can_you_guess_it/helpers/validators.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _body());
  }

  Widget _body() {
    return Stack(children: [
      Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            _logo(),
            _form(),
            _signInButton(),
          ],
        ),
      ),
      _register()
    ]);
  }

  Widget _logo() {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.only(top: 100, bottom: 100),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
    );
  }

  Widget _form() {
    return Container(
      child: Form(
        key: key,
          child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("User"),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 40,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: _userController,
                      validator: (String? value) {
                        Validators.textValidator(value!, "usuario");},
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          errorStyle: TextStyle(fontSize: 10,height: 0.3),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Password"),
                  Spacer(),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 40,
                      padding: EdgeInsets.zero,
                      child: TextFormField(

                        controller: _passController,
                        validator: (String? value) {Validators.passValidator(value!, "Contraseña");},
                        decoration:
                            InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                                errorStyle: TextStyle(fontSize: 10,height: 0.3),
                                border: OutlineInputBorder()),
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _signInButton() {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () {
              if(key.currentState!.validate()){}
            }, child: Text("Sign in")));
  }

  Widget _register() {
    return Positioned(
      bottom: 20,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {},
          child: Text("No tienes usuario? Regístrate aquí"),
        ),
      ),
    );
  }
}
