import 'package:ecommerce_newapi/businessLayer/cubit/my_cubit.dart';
import 'package:ecommerce_newapi/businessLayer/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSc extends StatelessWidget {
  HomeSc({super.key});
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(repo(Object)),
      child: BlocConsumer<MyCubit, MyState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
                bottomNavigationBar: CurvedNavigationBar(
                     
                     backgroundColor:  Color.fromARGB(255, 227, 227, 227),
                  index:MyCubit.get(context).index ,
                  onTap: (value)
                  {
                    MyCubit.get(context).ChangeBottomNav(value);

                  },
                  
                  items: [
                  
                    Icon(
                      CupertinoIcons.home,
                      
                      
                      
                       
                     
                    ),
                  
                   Icon(
                      CupertinoIcons.heart_fill,
                    ),
                 
                  Icon(
                      CupertinoIcons.settings,
                    ),
                ]),
                body:MyCubit.get(context).Screen[MyCubit.get(context).index] ,
              );
              
        },
        
      ),
    );
  }
}
