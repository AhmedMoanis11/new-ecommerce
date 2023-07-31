import 'package:ecommerce_newapi/businessLayer/cubit/my_cubit.dart';
import 'package:ecommerce_newapi/businessLayer/repo.dart';
import 'package:ecommerce_newapi/presentaionLayer/LoginSc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterSc extends StatelessWidget {
  var keyform = GlobalKey<FormState>();
  var passcontrollerRegist = TextEditingController();
  var namecontrollerRegist = TextEditingController();
  var phonecontrollerRegist = TextEditingController();
  var emailcontrollerRegist = TextEditingController();

  RegisterSc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(repo(Object)),
      child: BlocConsumer<MyCubit, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: keyform,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.0,
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
                      height: 30.0,
                    ),
                    Text(
                      'Create a new account ',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Please put your information bloew to create a new account for using app',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 146, 139, 139),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: 360,
                      child: Container(
                        child: TextFormField(
                          controller: namecontrollerRegist,
                          decoration: InputDecoration(
                            hintText: 'Full name',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your name";
                            }
                    
                            return null;
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(40.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: 360,
                      child: Container(
                        child: TextFormField(
                          controller: phonecontrollerRegist,
                          keyboardType: TextInputType.phone,
                          
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Phone number';
                            }
                            return null;
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                           color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: 360,
                      child: Container(
                        child: TextFormField(
                          controller: emailcontrollerRegist,
                          decoration: InputDecoration(
                            hintText: 'email ',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your email";
                            }
                    
                            return null;
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: 360,
                      child: Container(
                        child: TextFormField(
                          controller: passcontrollerRegist,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    
                    SizedBox(
                      width: 360,
                      child: Container(
                        width: double.infinity,
                          
                        child: TextButton(
                          onPressed: () {
                            if (keyform.currentState!.validate()) {
                              MyCubit.get(context).Register(
                                  name: namecontrollerRegist.text,
                                  phone: phonecontrollerRegist.text,
                                  email: emailcontrollerRegist.text,
                                  password: passcontrollerRegist.text);
                            }
                          },
                          child: Text(
                            'Register now',
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
                      height: 10.0,
                    ),
                     Row(
                  children: [
                    SizedBox(
                      width: 100.0,
                    ),
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginSc()));
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
