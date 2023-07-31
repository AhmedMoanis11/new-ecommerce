import 'package:ecommerce_newapi/businessLayer/cubit/my_cubit.dart';
import 'package:ecommerce_newapi/businessLayer/repo.dart';
import 'package:ecommerce_newapi/dataLayer/constance.dart';
import 'package:ecommerce_newapi/dataLayer/user.dart';
import 'package:ecommerce_newapi/presentaionLayer/HomeSc.dart';
import 'package:ecommerce_newapi/presentaionLayer/RegisterSc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class LoginSc extends StatelessWidget {
  var keyform = GlobalKey<FormState>();

  var passcontrollerLogin = TextEditingController();

  var emailcontrollerLogin = TextEditingController();
   UserRegister? user;
  LoginSc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(repo(Object)),
      child: BlocConsumer<MyCubit, MyState>(
        listener: (context, state) {
        if (state is SuccessLoginState )
        {
          if(state.UserCreateState.status)
          {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeSc()));
         Fluttertoast.showToast(
                msg: state.UserCreateState.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Color.fromARGB(255, 1, 4, 85),
                textColor: Colors.white,
                fontSize: 16.0
            );
            tokens=state.UserCreateState.data!.token;
            print('tokennnnnnn');
            print(tokens);


          }
          else
          {
             Fluttertoast.showToast(
                msg: state.UserCreateState.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor:const Color.fromARGB(255, 131, 11, 2),
                textColor: Colors.white,
                fontSize: 16.0
            );




          }
          
         




        }
       



        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: keyform,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          alignment: Alignment.topLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image(
                              image: AssetImage(
                                'assets/images/logo.jpg',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'e',
                          style: TextStyle(
                            color: Color.fromARGB(255, 246, 78, 12),
                            fontSize: 50.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          'shop',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Welcome to ',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'e',
                          style: TextStyle(
                            color: Color.fromARGB(255, 246, 78, 12),
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'shop ',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Please enter your address bleow to start using app ',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 146, 139, 139),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: TextFormField(
                          controller: emailcontrollerLogin,
                          decoration: InputDecoration(
                            hintText: 'Email ',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email_sharp,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter email";
                            }
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: TextFormField(
                          controller: passcontrollerLogin,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            }
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          CupertinoIcons.checkmark_square_fill,
                          color: Color.fromARGB(255, 22, 17, 64),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 1, 4, 85),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Forget password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 244, 121, 27),
                                fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 360,
                      child: Container(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            if (keyform.currentState!.validate()) {
                              MyCubit.get(context).LoginData(
                                  email: emailcontrollerLogin.text,
                                  password: passcontrollerLogin.text);
                            }
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                          color: Color.fromARGB(255, 246, 78, 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100.0,
                        ),
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterSc()));
                          },
                          child: Text(
                            'Join now',
                            style: TextStyle(
                                color: Color.fromARGB(255, 244, 121, 27),
                                fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
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
