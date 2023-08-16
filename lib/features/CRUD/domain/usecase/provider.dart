import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackermoondiooo/features/CRUD/domain/usecase/user_usecase.dart';

import '../../infrastrcture/repostiry/provider.dart';

final usersListProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImpl(ref.read(userListProvider));
});

final createUserProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImpl(ref.read(newUserProvider));
});

final updateUserDataProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImpl(ref.read(updateUserProvider));
});

final deleteUserDataProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImpl(ref.read(deleteUserProvider));
});
