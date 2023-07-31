import 'package:ecommerce_newapi/dataLayer/Home.dart';
import 'package:ecommerce_newapi/dataLayer/constance.dart';
import 'package:ecommerce_newapi/dataLayer/user.dart';
import 'package:ecommerce_newapi/dataLayer/web.dart';

// class repo {

//   Future<UserRegister> PostRegister(UserRegister CreateUser) async {
//     var response = await webServices.createUser({
//       'name':'${CreateUser.data!.name}',
//       'phone':'${CreateUser.data!.phone}',
//       'email':'${CreateUser.data!.email}',
//       'password':'${CreateUser.data!.password}',

//     });

//     return UserRegister.fromJson(response.toJson());
//   }
// }
class repo {
  repo(Object object);

  Future<UserRegister> RegisterPostData(
      {required Map<String, dynamic> dataa}) async {
    var response = await Dioinfo.PostData(urll: RegisterEndPoint, data: dataa);

    try {
      if (response.statusCode == 200) {
        return UserRegister.fromjason(response.data);
      } else {
        throw Exception('Failed to load Register data');
      }
    } catch (e) {
      throw Exception('Failed to load Register data: $e');
    }
  }

  Future<UserRegister> LoginPostData(
      {required Map<String, dynamic> dataa}) async {
    var response = await Dioinfo.PostData(urll: LoginEndPoint, data: dataa);
    try {
      if (response.statusCode == 200) {
        return UserRegister.fromjason(response.data);
      } else {
        throw Exception('Failed to load Login data');
      }
    } catch (e) {
      throw Exception('Failed to load Login data: $e');
    }
  }

  Future<Home> RepoHomeData() async {
    try {
      var response = await Dioinfo.GetData(urll: DataEndPoint);
      if (response.statusCode == 200) {
        final homeData = Home.fromJson(response.data);
        return homeData;
      } else {
        throw Exception('Failed to load home data');
      }
    } catch (e) {
      throw Exception('Failed to load home data: $e');
    }
  }

  Future<Products> GetProductDetails({required int idd}) async {
    var response = await Dioinfo.GetData(urll: 'products/$idd');
    return Products.fromJson(response.data);
  }

  Future<UserRegister> GetProfileData() async {
    var response = await Dioinfo.GetData(urll: ProfileEndPoint);
    return UserRegister.fromjason(response.data);
  }
}
