import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommercee/business_logic/login_cubit/cubit.dart';
import 'package:ecommercee/business_logic/login_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
bool isPassword = true;
var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(

      create: (BuildContext context) =>LoginCubit(),
      child:
      BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            body: SingleChildScrollView(
              child:
              Form(
                key: formKey,
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
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder:(context)=>defaultButton(
                          text: 'LOGIN',
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          }),
                      fallback: (context)=> Center(child: CircularProgressIndicator()),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
