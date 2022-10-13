import 'package:can_you_guess_it/helpers/app_theme.dart';
import 'package:can_you_guess_it/screens/login.dart';
import 'package:can_you_guess_it/widgets/text_forms.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> key = GlobalKey();

  bool _termsCondCheck = false;

  TextEditingController _mailController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _passConfController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("Register"),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 50),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [_form(), _termsCond(), _registerButton()],
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: key,
        child: Column(
      children: [
        WidgetCollection.mailFormField("mail",_mailController , context),
        WidgetCollection.textFormField("user", _userController, context),
        WidgetCollection.passFormField("password", _passController ,context),
        WidgetCollection.passFormField("confirm password", _passConfController, context),
        //WidgetCollection.textFormField("pais", , context),
      ],
    ));
  }

  Widget _termsCond() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
              value: _termsCondCheck,
              onChanged: (value) {
                print(value);
                setState((){
                  _termsCondCheck = !_termsCondCheck;
                });

              }),
          RichText(
              maxLines: 2,
              text: TextSpan(children: <TextSpan>[
                TextSpan(text: "He leído y acepto los "),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //todo open terms
                      },
                    text: "términos y condicones ",
                    style: TextStyle(color: AppThemeCustom.PrimaryColor)),
                TextSpan(text: "y \n"),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //todo open privacy
                        print("aqui se abre privacy");
                      },
                    text: "la política de privacidad",
                    style: TextStyle(color: AppThemeCustom.PrimaryColor)),
              ])),
        ],
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      color: Colors.red,
      child: ElevatedButton(
        onPressed: () {
          if(key.currentState!.validate()){}
        },
        child: Text("Registrar"),
      ),
    );
  }
}
