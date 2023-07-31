import 'package:ecommerce_newapi/businessLayer/repo.dart';
import 'package:ecommerce_newapi/dataLayer/Home.dart';
import 'package:ecommerce_newapi/dataLayer/user.dart';
import 'package:ecommerce_newapi/presentaionLayer/ProductSc.dart';
import 'package:ecommerce_newapi/presentaionLayer/favSc.dart';
import 'package:ecommerce_newapi/presentaionLayer/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  MyCubit(this.myrepo) : super(MyInitial());
  static MyCubit get(context) => BlocProvider.of(context);

  final repo myrepo;
  late UserRegister DataUser;
  Home? homemodel;

  // void Register({required UserRegister usercubit}) {
  //   emit(LoadingRegisterState());
  //   myrepo.PostRegister(usercubit).then((value) {
  //     print(value.message);
  //     print(value.data!.phone);
  //     emit(SuccessRegisterState(value));
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(ErrorRegisterState(e.toString()));
  //   });
  // }

  void Register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(LoadingRegisterState());
    myrepo.RegisterPostData(dataa: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data!.name);
      print(value.message);
      DataUser = UserRegister.fromjason(value.data as Map<String, dynamic>);
      emit(SuccessRegisterState(value));
    }).catchError((e) {
      print(e.toString());
      emit(ErrorRegisterState(e.toString()));
    });
  }

  void LoginData({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginrState());
    myrepo.LoginPostData(dataa: {'email': email, 'password': password})
        .then((value) {
      print(value.message);
      print('aaaaaaaaa');
      print(value.data!.token);

      emit(SuccessLoginState(value));
    }).catchError((e) {
      print(e.toString());
      emit(ErrorLoginState(e.toString()));
    });
  }

  int index = 0;

  void ChangeBottomNav(indexx) {
    index = indexx;
    emit(ChangeBottomNavState());
  }

  List<Widget> Screen = [
    ProductSc(),
    FavSc(),
    SettingSc(),
  ];

  void GetHomeData() {
    emit(LoadingHomeState());

    myrepo.RepoHomeData().then((value) {
      homemodel = value;
      print(homemodel!.data!.products[5].id);
      print(value.data!.products[5].image);
      print(value.status);
      emit(SuccessHomeState(value));
    }).catchError((e) {
      print(e.toString());
      emit(ErrorHomeState(e.toString()));
    });
  }

  void ProfileData() {
    emit(LoadingProfileData());
    myrepo.GetProfileData().then((value) {
      print('>>>>>>>>>>>>>>');
     
      emit(SuccessProfileData(value));
    }).catchError((e) {
      print(e.toString());
      emit(ErrorProfileData(e.toString()));
    });
  }
}
