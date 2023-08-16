import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackermoondiooo/features/CRUD/domain/repositry/user_Repositry.dart';
import 'package:hackermoondiooo/features/CRUD/infrastrcture/repostiry/user_repository_implementation.dart';

final userListProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImp();
});

final newUserProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImp();
});

final updateUserProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImp();
});

final deleteUserProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImp();
});
