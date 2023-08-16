import 'package:hackermoondiooo/features/CRUD/domain/modal/user.dart';

import '../modal/new_user.dart';
import '../repositry/user_Repositry.dart';

abstract class UserUseCase {
  Future<List<User>> getAllUsers();
  Future<NewUser> createNewUser(String name, String job);
  Future<NewUser> updateUserInfo(String id, String name, String job);
  Future<void> deleteUserInfo(String id);
}

class UserUseCaseImpl extends UserUseCase {
  final UserRepository userRepository;

  UserUseCaseImpl(this.userRepository);

  @override
  Future<List<User>> getAllUsers() async {
    return await userRepository.getusers();
  }

  @override
  Future<NewUser> createNewUser(String name, String job) async {
    return await userRepository.addNewUser(name, job);
  }

  @override
  Future<NewUser> updateUserInfo(String id, String name, String job) async {
    return await userRepository.updateUser(id, name, job);
  }

  @override
  Future<void> deleteUserInfo(String id) async {
    return await userRepository.deleteUser(id);
  }
}
