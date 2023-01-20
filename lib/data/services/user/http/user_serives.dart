// import 'dart:convert';
// import 'dart:developer';

// import 'package:blog_app_riverpod/data/core/const/app_urls.dart';

// import 'package:blog_app_riverpod/data/models/users/users.dart';
// import 'package:http/http.dart' as http;

// class UserServices {
//   Future<List<User>> getAllUser() async {
//     List<User> users = [];
//     try {
//       Uri userUri = Uri.parse("${AppUrls.baseUrl}${AppUrls.getAllUserUrl}");
//       final response = await http.get(
//         userUri,
//         headers: {
//           "accept": "application/json",
//         },
//       );
//       log(response.body);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final users = Users.fromMap(data);
//         return users.users;
        
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     return users;
//   }


 
// }
