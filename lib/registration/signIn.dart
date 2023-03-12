
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:colour/colour.dart';
import 'package:phoenix/registration/signUp.dart';
import 'package:phoenix/shared/components/component.dart';
import '../screens/homepage.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool ?passwordVisible = false;
  var password, email;
  GlobalKey<FormState>formstate = GlobalKey<FormState>();

  signIn()async{
    var formdata =formstate.currentState;
    formdata!.save();
    if (formdata.validate()){
      print('Valid');
      formdata.save();
      try{
        UserCredential  userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential;
      }on FirebaseAuthException catch(e){
        if(e.code == "User-not-found"){
          AwesomeDialog(
            context: context,
            title: 'Error',
            body: const Text("No user found for this email"),
          ).show();
        }else if(e.code == "wrong-password"){
          AwesomeDialog(
            context: context,
            title: 'Error',
            body:const Text("Wrong password provided for that email"),
          ).show();
        }
      }catch(e){
        print(e);
      }
    }else{

      print('Not Valid');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 30,
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    child:const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image(
                        image:AssetImage('assets/images/logo.jpg'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 100,
                  ),
                  child:Text(
                    'Sign In',
                    style:TextStyle(
                      color: Colour("#008894"),
                      fontSize: 40,
                      fontWeight:FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 20,
                  ),
                  child: Container(
                    color:Colors.blueGrey[50],
                    child: TextFormField(
                      keyboardType:TextInputType.emailAddress,
                      validator: (val) {
                        if(val!.isEmpty){
                          return("Not valid.Please try again");
                        }
                        if (val.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "Email can't to be less than 2 letter";
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10),
                        ),
                        labelText: 'E-mail',
                        prefixIcon: const Icon(
                          Icons.mail,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                  ),
                  child: Container(
                    color:Colors.blueGrey[50],
                    child: TextFormField(
                      validator: (val) {
                        if(val!.isEmpty){
                          return("please enter your password");
                        }
                        if (val.length > 100) {
                          return "Password can't to be larger than 100 letter";
                        }
                        if (val.length < 4) {
                          return "Password can't to be less than 4 letter";
                        }
                        return null;
                      },

                      obscureText: passwordVisible!,
                      decoration:InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10),
                        ),
                        labelText: 'Password',
                        prefixIcon:const Icon(
                          Icons.lock_outline_sharp,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 190,
                  ),
                  child: TextButton(
                    child:Text(
                      'Forget Password?',
                      style:TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:Colour('#505050'),
                      ),
                    ),
                    onPressed:(){},
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
                defButton(
                  text: 'Sign In',
                  pressed: ()async{
                    if(formstate.currentState!.validate()){
                      Navigator.push(context,MaterialPageRoute(builder:(_)=>HomePage()));

                    }
                    UserCredential ?response = await signIn();
                    if(response != null){
                      print("Hiii");

                    }else{
                      print('Sign Up Failed');
                    }
                  },
                ),
               const SizedBox(
                  height: 12,
                ),
                Container(
                  width: 370,
                  height: 50,
                  color:Colors.white60,
                  child: Material(
                    borderRadius:BorderRadius.circular(16),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              child:const Image(
                                image:AssetImage('assets/images/pic2.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal:18,
                              ),
                              child: Text(
                                'Sign In with Google',
                                style:TextStyle(
                                    fontSize: 20,
                                    color: Colour('#505050'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
               const  SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style:TextStyle(
                        fontSize:17,
                        fontWeight:FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>SignUp())),
                      child:Text(
                        'sign up',
                        style:TextStyle(
                          fontSize:19,
                          fontWeight:FontWeight.w800,
                          color:Colour('#008894'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
