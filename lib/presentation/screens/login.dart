import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                height: 230,
                  width: 230,
                  child: Image.asset('assets/images/shop1.png')),
              SizedBox(height: 15,),
              defaultFormField(
                prefix: Icons.email_outlined,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                label:'Email',
                validate:(String? value){
                  if(value!.isEmpty)
                  {
                    return'Email Not Right';
                  }
                }
              ),
              defaultFormField(
                prefix: Icons.lock_clock_outlined,
                isPassword: isPassword,
                controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                suffixPressed: (){},
                suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                label: 'Password',
                  validate:(String? value){
                    if(value!.isEmpty)
                    {
                      return'Password Nor Right';
                    }
                  }
              ),
              defaultButton(text: 'LOGIN', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
