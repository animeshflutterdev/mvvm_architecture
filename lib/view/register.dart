import 'package:flutter/material.dart';
import 'package:new_mvvm/utils/utils.dart';
import 'package:new_mvvm/view_model/auth_view_mode.dart';
import 'package:provider/provider.dart';

import '../resources/btn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FocusNode email = FocusNode();
  FocusNode password = FocusNode();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pswCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "Email", labelText: "Email"),
              focusNode: email,
              controller: emailCtrl,
              onFieldSubmitted: (v) {
                Utils.fieldFocus(context, email, password);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Password", labelText: "Password"),
              focusNode: password,
              controller: pswCtrl,
              onFieldSubmitted: (v) {},
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
              loading: authViewModel.signupLoading,
              onPressed: () {
                // Map data = {
                //   "email": emailCtrl.text.toString(),
                //   "password": pswCtrl.text.toString(),
                // };

                Map data = {
                  "email": "eve.holt@reqres.in",
                  "password": "pistol"
                };
                authViewModel.registerApiViewModel(data, context).then((value) {
                  emailCtrl.clear();
                  pswCtrl.clear();
                });
              },
              title: "Register".toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }
}
