import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hackermoondiooo/core/internet_Services/dio_client.dart';
import 'package:hackermoondiooo/core/internet_Services/dio_exception.dart';
import 'package:hackermoondiooo/core/internet_Services/paths.dart';
import 'package:hackermoondiooo/features/CRUD/domain/modal/new_user.dart';
import 'package:hackermoondiooo/features/CRUD/domain/modal/user.dart';
import 'package:hackermoondiooo/features/CRUD/domain/repositry/user_Repositry.dart';

class UserRepositoryImp implements UserRepository {
  @override
  Future<NewUser> addNewUser(String name, String job) async {
    try {
      final response = await DioClient.instance.post(users, data: {
        'name': name,
        'job': job,
      });
      return NewUser.fromJson(response);
    } on DioException catch (e) {
      var error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
    // throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      await DioClient.instance.delete('$users/$id');
    } on DioException catch (e) {
      var error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<List<User>> getusers() async {
    // TODO: implement getusers
    try {
      final response = await DioClient.instance.get(users);
      List<User> userLists = [];

      for (var user in response['data']) {
        User userfromjson = User.fromJson(user);
        userLists.add(userfromjson);
      }
      return userLists;
    } on DioError catch (e) {
      var error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<NewUser> updateUser(String id, String name, String job) async {
    try {
      final response = await DioClient.instance.put(
        '$users/$id',
        data: {
          'id': id,
          'name': name,
          'job': job,
        },
      );
      return NewUser.fromJson(response);
    } on DioException catch (e) {
      var error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
