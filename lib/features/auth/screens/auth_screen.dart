import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth{   //enum will keep track of radio button we are on as it define a set of named constant values
  signin,
  signup
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;  //*_auth is assigned the Auth.signup value from the Auth enum. This is a way to specify that _auth is currently in the signup state
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
//*GlobalKey is a type of key used to uniquely identify widgets and manage their state. FormState is a type that represents the state of a Form widget. By creating a GlobalKey<FormState>, you're creating a key that will manage the state of a form widget.
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _nameController = TextEditingController();


@override
void dispose(){
  super.dispose();
   _emailController.dispose();
  _passwordController.dispose();
  _nameController.dispose();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
       body: SafeArea(child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome',
            style: TextStyle(
              fontSize:22,
              fontWeight:FontWeight.w500,
            ),
            ),
            ListTile(    //* used for creating list items with a standard format.
            tileColor: _auth == Auth.signup ? GlobalVariables.backgroundColor: GlobalVariables.greyBackgroundCOlor,
              title:const Text(
                'Create Account',
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value:Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val){
                  setState(() {
                     _auth = val!;
                  });
                }
              )

            ),
            
            if(_auth == Auth.signup)
               Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                 child: Form(child: Column(children: [
                    CustomTextField(controller: _emailController,
                  hintText: 'Name',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(controller: _emailController,
                  hintText: 'Email',
                  ),
                                  const SizedBox(height: 10),
                    CustomTextField(controller: _emailController,
                  hintText: 'Password',
                  ),
               const SizedBox(height: 10),
               CustomButton(text: 'signup', onTap: () {
               })
                  
                 ],) ,),
               ),


              ListTile(    //* used for creating list items with a standard format.
                          tileColor: _auth == Auth.signin ? GlobalVariables.backgroundColor: GlobalVariables.greyBackgroundCOlor,
              title:const Text(
                'Sign-In',
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value:Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val){
                  setState(() {
                     _auth = val!;
                  });
                }
              )

            ),
              if(_auth == Auth.signin)
               Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                 child: Form(child: Column(children: [
                  const SizedBox(height: 10),
                  CustomTextField(controller: _emailController,
                  hintText: 'Email',
                  ),
                                  const SizedBox(height: 10),
                    CustomTextField(controller: _emailController,
                  hintText: 'Password',
                  ),
               const SizedBox(height: 10),
               CustomButton(text: 'signup', onTap: () {
               })
                  
                 ],) ,),
               ),
         ],
         ),
       ),
        ),
    );
  }
}