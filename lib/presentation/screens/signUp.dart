import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gpt3/const/const.dart';

import '../../logic/signUp_cubit/sign_up_cubit.dart';

class Sign_Up extends StatelessWidget {
  Sign_Up({Key? key}) : super(key: key);

  final TextEditingController mail = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(

        body: Container(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              Card(
                child: BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    if(state is SignUpInitial) {
                      return Column(
                        children: <Widget>[

                          Text("Sign Up", style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold),),

                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "E-mail"
                            ),
                            controller: mail,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
                              if(!(emailRegex.hasMatch(value!))) {
                                return 'Please enter valid mail';
                              }
                            },
                          ),

                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Password"
                            ),
                            controller: pass,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              if(!(passwordRegex.hasMatch(value!))) {
                                return 'Please enter valid password';
                              }
                          },
                          ),

                          ElevatedButton(
                              onPressed: (){
                                BlocProvider.of<SignUpCubit>(context).MailAndPasswordVerification(mail.text, pass.text);
                              },
                              child: Text("Sign Up")),

                        ],
                      );
                    } else if(state is SignUpError) {
                      return Container();
                    } else if(state is SignUpVerified) {
                      return Container();
                    } else {
                      return Container();
                    }
                  },
                ),
              ),

            ],

          ),
        ),

      ),
    );
  }
}
