import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackermoondiooo/features/CRUD/domain/usecase/provider.dart';
import 'package:hackermoondiooo/features/CRUD/presentation/screens/create_user_sscreen.dart';

import '../../domain/modal/user.dart';

class UserListProvider extends ChangeNotifier {
  UserListProvider({required this.providerRef});

  late final ChangeNotifierProviderRef providerRef;
  List<User> users = [];
  bool isLoading = false;
  Future<void> init() async {
    users = await providerRef.watch(usersListProvider).getAllUsers();
    isLoading = true;
    notifyListeners();
  }

  navigatetoCreation(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateUser(),
        ));
  }
}

final getUsersProvider = ChangeNotifierProvider<UserListProvider>(
    (ref) => UserListProvider(providerRef: ref));
