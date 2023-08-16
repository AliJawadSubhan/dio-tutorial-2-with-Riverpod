import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackermoondiooo/features/CRUD/domain/usecase/provider.dart';

import '../../domain/modal/new_user.dart';

class NewUserProvider extends ChangeNotifier {
  final ChangeNotifierProviderRef ref;
  bool isLoading = false;
  late final NewUser? newUser;
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  NewUserProvider({required this.ref});

  Future<void> createNewUser() async {
    isLoading = true;
    notifyListeners();
    final response = await ref.watch(createUserProvider).createNewUser(
        nameController.text.toString(), jobController.text.toString());
    newUser = response;
    log(response.createdAt.toString());
    isLoading = false;
    notifyListeners();
  }
}

final createNewUserProvider =
    ChangeNotifierProvider<NewUserProvider>((ref) => NewUserProvider(ref: ref));
