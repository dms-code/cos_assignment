import 'package:cos_assignment/core/auth/auth.dart';
import 'package:cos_assignment/core/util/validators.dart';
import 'package:cos_assignment/data/repositories/user/user_repository.dart';
import 'package:cos_assignment/domain/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/signup_screen_state.dart';
import 'package:rxdart/rxdart.dart';

part 'signup_view_model.g.dart';

/// The `SignUpScreenVM` is a view model class that manages the state of the signup screen.
///
/// It provides the following functionality:
///
/// - **Email Validation**: Validates the email input using the [Validators.validateEmail] method.
/// - **User Registration**: Registers a new user using the [saveUser] method.
/// - **User Error Handling**: Handles errors that may occur during the user registration operation.
/// - **User State Management**: Manages the state of the signup screen using the [state] property.

@riverpod
class SignUpScreenVM extends _$SignUpScreenVM {

  late UserRepository _userRepo;
  late Auth _authProvider;
  final _emailInput = BehaviorSubject<String>();
  final _emailValidation = BehaviorSubject<Either<bool, EmailError>>();

  Stream<Either<bool, EmailError>> get emailStream => _emailValidation.stream;

  @override
  SignUpScreenState build() {

    _loadProviders();

    _emailInput
        .debounceTime(const Duration(milliseconds: 800))
        .distinct()
        .switchMap(_validateEmail)
        .listen((validationResult) {
        _emailValidation.value = validationResult;
    });

    ref.onDispose(() {
      dispose();
    });

    return SignUpScreenState.initial();
  }

  void setEmail(String value) {
    _emailInput.add(value);
  }

  Future<void> _loadProviders() async {
      _userRepo = await ref.read(userRepositoryProvider.future);
      _authProvider = ref.read(authProvider.notifier);
  }


  Stream<Either<bool, EmailError>> _validateEmail(String email) async* {
    yield* Stream.fromFuture(Future(() {
      return Validators.validateEmail(email).fold((validation) {
        state = state.copyWith(email:email, emailValid: validation, emailError: null);
        return Left(validation);
      }, (error) {
        state = state.copyWith(emailValid: false, emailError: error.message);
        return Right(error);
      });
    }));
  }

  Future<void> saveUser() async {

    if(state.emailValid){
      final newUser = User(email: state.email!);
      final userEither = await _userRepo.insert(newUser);

      userEither.fold(
        (newUser) {
          //Update the AuthProvider
          _authProvider.setUser(newUser);
        }, 
        (error) {
          
        }
      );
    }
  } 

  void dispose() {
    _emailInput.close();
    _emailValidation.close();
  }
}
