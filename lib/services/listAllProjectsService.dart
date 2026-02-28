
import 'dart:convert';

import 'package:taskline/model/listAllProjects.dart';
import 'package:taskline/utils/api_routes.dart';
import 'package:http/http.dart' as http;
class Listallprojectsservice {

  Future<Listallprojects?> fetchAllProjects(String token) async{
   final projectsurl=ApiRoutes.listAllProjects;
   Uri url=Uri.parse(projectsurl);
   final  headers= {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token",
   };
   final response=await http.get(url,headers: headers);

   if (response.statusCode==200){
    print("Projects fetched succesfully in service");
    final responseData= json.decode(response.body);
    return Listallprojects.fromJson(responseData);
    
   }
   else{
    print("Error fetching projects from Api: ${response.statusCode}");
    return null;
   }
  }
}