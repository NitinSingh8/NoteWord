import 'package:flutter/material.dart';
import 'package:note_word/widgets/input_data.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final usernameInput = TextEditingController();
  final passwordInput = TextEditingController();

  void doLogin(){
    Navigator.pushReplacementNamed(context, '/dashboard');
    print("Move to dashboard");
  }



  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Yourself")),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.info))
        ],
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left:20,bottom: 20,top:20,right:20),
              child: Column(
                children: [
                  Text("Login Here",style: TextStyle(fontSize: 20),),
                  Input_Data(textValue : usernameInput,hinttext: "Enter your username"),
                  Input_Data(textValue : passwordInput, hinttext : "Enter your password", isObscure: true ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: (){doLogin();},
                          // style: ButtonStyle(backgroundColor: Color(23523)),
                          child: Text("Login", style: TextStyle(fontSize: 32,color: Colors.white,),)
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){},
                    child: Column(
                      children: [
                        Text("Forget username or password?",style: TextStyle(color: Colors.red)),
                        Text("Reset here.......",style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
