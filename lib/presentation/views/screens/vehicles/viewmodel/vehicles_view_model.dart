import 'package:cos_assignment/core/util/validators.dart';
import 'package:cos_assignment/domain/models/enums.dart';
import 'package:cos_assignment/domain/models/vehicles.dart';
import 'package:cos_assignment/domain/repositories/vehicles/vehicles_repository.dart';
import 'package:cos_assignment/presentation/views/screens/vehicles/state/vehicles_screen_state.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'vehicles_view_model.g.dart';

/// The `VehiclesScreenVM` is a view model class that manages the state of the vehicles screen.
///
/// It provides the following functionality:
///
/// - **VIN Validation**: Validates the VIN input using the [Validators.validateVIN] method.
/// - **Vehicle Search**: Searches for a vehicle using the [search] method.
/// - **Vehicle Chaching**: Caches the vehicle data in the database.
/// - **Vehicle Error Handling**: Handles errors that may occur during the vehicle search operation.
/// - **Vehicle State Management**: Manages the state of the vehicles screen using the [state] property.

@riverpod
class VehiclesScreenVM extends _$VehiclesScreenVM {
  late VehiclesRepository _vehiclesRepo;
  final _vinInput = BehaviorSubject<String>();
  final _vinValidation = BehaviorSubject<Either<bool, VINError>>();

  Stream<Either<bool, VINError>> get vinStream => _vinValidation.stream;

  @override
  VehiclesScreenState build() {
    _loadProviders();

    _vinInput
        .debounceTime(const Duration(milliseconds: 800))
        .distinct()
        .switchMap(_validateVIN)
        .listen((validationResult) {
      _vinValidation.value = validationResult;
    });

    // ref.onDispose(() {
    //   dispose();
    // });

    return VehiclesScreenState.initial();
  }

  void setVIN(String value) {
    _vinInput.value = value;
  }

  void setSnackTriggered(bool value) {
    state = state.copyWith(snackTriggered: value);
  }

  Future<void> _loadProviders() async {
    _vehiclesRepo = await ref.read(vehiclesRepositoryProvider.future);
  }

  Stream<Either<bool, VINError>> _validateVIN(String vin) async* {
    yield* Stream.fromFuture(Future(() {
      return Validators.validateVIN(vin).fold((validation) {
        state = state.copyWith(vin: vin, vinValid: validation);
        return Left(validation);
      }, (error) {
        state = state.copyWith(vinValid: false, vinError: error.message);
        return Right(error);
      });
    }));
  }

  Future<void> search() async {
    if (state.vinValid) {

      //Clear Errors
      state = state.copyWith(snackTriggered: false, vehicleError: null, isWaiting: false);

      final vehicleEither =
          await _vehiclesRepo.getAll(Vehicle(vin: state.vin!));

      vehicleEither.fold((vehicles) {
        if (vehicles.length == 1) {
          state = state.copyWith(vehicle: vehicles.first);
        } else {
          state = state.copyWith(options: vehicles, openOptions: true);
        }
      }, (error) async {
        // Load data from cache
        if (state.vin != null) {
          final cacheEither =
              await _vehiclesRepo.getCached(Vehicle(vin: state.vin!));

          bool isDelay = error.type == VehicleErrorType.delay;

          cacheEither.fold((cachedVehicle) {
            state = state.copyWith(
                vehicle: cachedVehicle,
                vehicleError: error,
                isWaiting: isDelay);
          }, (cacheError) {
            state = state.copyWith(
                vehicle: null, vehicleError: error, isWaiting: isDelay);
          });

          if(isDelay){
            _delayNextSearch(error);
          }
        }
      });
    }
  }

  void dispose() {
    _vinInput.close();
    _vinValidation.close();
  }

  void _delayNextSearch(VehicleError error) {
    Future.delayed(Duration(seconds: error.delay!), () {
      state = state.copyWith(snackTriggered: false, vehicleError: null, isWaiting: false);
    });
  }

  void setVehicle(Vehicle vehicle) {
    state = state.copyWith(vehicle: vehicle, openOptions: false, options: null);
  }

  void clearOptions() {
    state = state.copyWith(openOptions: false, options: null);
  }
}
