import 'package:hackermoondiooo/features/CRUD/domain/modal/new_user.dart';
import 'package:hackermoondiooo/features/CRUD/domain/modal/user.dart';

abstract class UserRepository {
  Future<List<User>> getusers();
  Future<NewUser> addNewUser(String name, String job);
  Future<NewUser> updateUser(String id, String name, String job);
  Future<void> deleteUser(String id);
}
