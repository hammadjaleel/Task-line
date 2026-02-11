import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskline/model/user.dart';
import 'package:taskline/services/auth_services.dart';

class AuthProviders extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  final AuthServices _authServices = AuthServices();


  Future<User?> login(String email, String password) async {
    final user=await _authServices.loginUser(email, password);
    if(user!=null){
      _user=user;
      print("Data is in the provider: ${_user!.name}, ${_user!.email}");
      final pref=await SharedPreferences.getInstance();
      await pref.setString("token", user.token);
      notifyListeners();
      return user;
    }else{
      print("Login failed in provider");
      return null;
    }
  }

  Future<User?> register(String name, String email, String password, String confirmPassword) async {
    final user=await _authServices.registerUser(name, email, password, confirmPassword);
    _user=user;
    if(user!=null){
      print("Data is in the provider: ${_user!.name}, ${_user!.email}");
      final pref=await SharedPreferences.getInstance();
      await pref.setString("token", user.token);
      notifyListeners();
      return user;
    }else{
      print("Registration failed in provider");
      return null;
    }
  }


  Future<void> logout() async {
    _user = null;
    final pref=await SharedPreferences.getInstance();
    await pref.remove("token");
    print(" User logged out, token removed from shared preferences");
    notifyListeners();
  }
}