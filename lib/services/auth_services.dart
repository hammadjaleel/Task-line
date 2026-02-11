import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskline/model/user.dart';
import 'package:taskline/utils/api_routes.dart';

class AuthServices {

  //register user
  Future<User?> registerUser(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    //send request to backend and get response
    final registerRoute = Uri.parse(ApiRoutes.register);
    final requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    final requestBody = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
    });
    final response = await http.post(
      registerRoute,
      headers: requestHeaders,
      body: requestBody,
    );

    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      print(responseData.toString());
      final user = User.fromJson({
        "name": responseData["data"]["user"]["name"],
        "email": responseData["data"]["user"]["email"],
        "token": responseData["data"]["token"],
      });
      return user;
    } else {
      // Handle error
      print("registration failed with status code: ${response.statusCode}");
      return null;
    }
  }

  //login user
  Future<User?> loginUser(String email, String password) async {
    //send request to backend and get response
    final logintoute = Uri.parse(ApiRoutes.login);
    final requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    final requestBody = json.encode({"email": email, "password": password});
    final response = await http.post(
      logintoute,
      headers: requestHeaders,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData.toString());

      final user = User.fromJson({
        "name": responseData["data"]["user"]["name"],
        "email": responseData["data"]["user"]["email"],
        "token": responseData["data"]["token"],
      });
      return user;
    } else {
      // Handle error
      print("login failed with status code: ${response.statusCode}");
      return null;
    }
  }
}
