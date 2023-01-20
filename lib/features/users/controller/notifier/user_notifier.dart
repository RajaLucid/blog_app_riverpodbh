// import 'package:blog_app_riverpod/features/users/state/user_state.dart';
// import 'package:blog_app_riverpod/data/services/user/http/user_serives.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class UsersNotifier extends StateNotifier<UserState> {
//   UsersNotifier() : super(InitialUserState()) {
//     fetchUsers();
//   }
//   final _userServices = UserServices();

//   void fetchUsers() async {
//     try {
//       state = UsersLoadingState();
//       final users = await _userServices.getAllUser();
//       state = UsersLoadedState(users: users);
//     } catch (e) {
//       state = UserErrorState(message: e.toString());
//     }
//   }
// }
