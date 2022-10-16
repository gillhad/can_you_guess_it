import 'package:can_you_guess_it/helpers/user_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/providers/user_provider.dart';
import 'myApp.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=> UserHelper()),
      ],
      child: MyApp()
      ),
  );

}


