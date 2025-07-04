
import 'package:cos_assignment/core/auth/auth_state.dart';
import 'package:cos_assignment/data/repositories/user/user_repository.dart';
import 'package:cos_assignment/domain/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

/// The `Auth` is a state class that provides access to the authentication state.
@riverpod
class Auth extends _$Auth{
  
   @override
   AuthState build() {

    final state = AuthState.init();

    _checkUserRegistered();

    return state;
   }   

   void _checkUserRegistered() async {

      final provider = await ref.watch(userRepositoryProvider.future);
      final either = await provider.getFirst();

      either.fold(
        (user){
          state = state.copyWith(user: user);
        },
        (error){
          state = state.copyWith(user: null);
        }
      );
   }

   User? getUser() => state.user;
   void setUser(User user) => state = state.copyWith(user: user);

}