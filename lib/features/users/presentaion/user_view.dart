// import 'package:blog_app_riverpod/features/users/controller/provider/user_notifier_provider.dart';
// import 'package:blog_app_riverpod/features/users/presentaion/Widgets/user_list_view.dart';
// import 'package:blog_app_riverpod/features/users/state/user_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class UsersView extends ConsumerWidget {
//   const UsersView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Users"),
//       ),
//       body: Consumer(
//         builder: (context, ref, child) {
//           final userState = ref.watch(userNotifierProvider);
//           //print(userState);
//           if (userState is InitialUserState) {
//             return const Text("press button to fetch");
//           }
//           if (userState is UsersLoadingState) {
//             return const CircularProgressIndicator();
//           }
//           if (userState is UsersLoadedState) {
//             return usersListView(userState);
//           }
//           if (userState is UserErrorState) {
//             return Text(userState.message);
//           }
//           return const Center(
//             child: Text("Something went wrong"),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ref.read(userNotifierProvider.notifier).fetchUsers();
//         },
//         child: const Icon(Icons.addchart),
//       ),
//     );
//   }
// }
