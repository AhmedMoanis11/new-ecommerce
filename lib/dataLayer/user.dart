class UserRegister {
  late bool status;
  late String message;
  UserLogin? data;

  UserRegister.fromjason(Map<String, dynamic> jason) {
    status = jason['status'];
    message = jason['message'];
    data = jason['data'] != null ? UserLogin.JasonData(jason['data']) : null;
  }
}

class UserLogin {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? image;

  String? token;

  UserLogin.JasonData(Map<String, dynamic> jason) {
    name = jason['name'];
    email = jason['email'];
    phone = jason['phone'];
    password = jason['password'];
    image = jason['image'];
    
    token = jason['token'];
  }
}
