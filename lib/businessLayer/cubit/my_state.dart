part of 'my_cubit.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class LoadingRegisterState extends MyState {}

class SuccessRegisterState extends MyState {
  final UserRegister UserCreateState;

  SuccessRegisterState(this.UserCreateState);
}

class ErrorRegisterState extends MyState {
  final String error;

  ErrorRegisterState(this.error);
}

//////////////////////////////////////////////////////
class LoadingLoginrState extends MyState {}

class SuccessLoginState extends MyState {
  final UserRegister UserCreateState;

  SuccessLoginState(this.UserCreateState);
}

class ErrorLoginState extends MyState {
  final String error;

  ErrorLoginState(this.error);
}

/////////////////////////////////////////////////////////////
class LoadingHomeState extends MyState {}

class SuccessHomeState extends MyState {
  final Home homedata;

  SuccessHomeState(this.homedata);
}

class ErrorHomeState extends MyState {
  final String error;

  ErrorHomeState(this.error);
}

class ChangeBottomNavState extends MyState {}
//////////////////////////////////////////////////////////////

class LoadingProfileData extends MyState{}
class SuccessProfileData extends MyState{
  final UserRegister ProductDetails;

  SuccessProfileData(this.ProductDetails);
   
  
}
class ErrorProfileData extends MyState
{

  final String Error;

  ErrorProfileData(this.Error);
  
}
