import 'package:cos_assignment/core/theme/cos_theme.dart';
import 'package:cos_assignment/domain/models/enums.dart';
import 'package:cos_assignment/presentation/views/screens/vehicles/viewmodel/vehicles_view_model.dart';
import 'package:cos_assignment/presentation/views/widgets/vehicle_card.dart';
import 'package:cos_assignment/presentation/views/widgets/vehicle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The `VehiclesScreen` is the primary interface for vehicle lookups.
///
/// It provides users with the ability to search for a vehicle using its
/// Vehicle Identification Number (VIN). The screen dynamically updates to
/// reflect the state of the search operation, handling the following scenarios:
///
/// - **Initial State**: Displays a search bar and a "Search" button.
/// - **Single Result**: Displays a `VehicleCard` with the details of the found vehicle.
/// - **Multiple Results**: Presents a `VehicleList` in a modal sheet for user selection.
/// - **Error/No Results**: Displays a relevant error message to the user.

class VehiclesScreen extends ConsumerWidget {
  static String route = "vehicles";
  final String appTitle = "CarOnSale";
  final String action = "Search a VIN:";
  final String cta = "Search";

  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<CosThemeExtension>()!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //remove the back button
        backgroundColor: theme.yellow,
        title: Text(appTitle),
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                  top: theme.pad10, left: theme.pad10, right: theme.pad10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(action, style: TextStyle(fontSize: theme.subTitle)),
                  theme.mediumVSpace(),
                  _buildSearchInput(ref, theme),
                  theme.mediumVSpace(),
                  _displayResults(ref),
                  _displayError(context, ref),
                  _displayOptionSheet(context, ref)
                ],
              ))),
      persistentFooterButtons: [_buildSearchButton(ref, theme)],
    );
  }

  Widget _buildSearchInput(WidgetRef ref, CosThemeExtension theme) {
    final vinScreenVM = ref.watch(vehiclesScreenVMProvider.notifier);

    return StreamBuilder(
      stream: vinScreenVM.vinStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _buildSearchInputDefault(ref, theme);
        }

        final either = snapshot.data!;

        return either.fold(
          (success) => _buildSearchInputDefault(ref, theme),
          (error) => _buildSearchInputError(ref, theme),
        );
      },
    );
  }

  Widget _buildSearchInputDefault(WidgetRef ref, CosThemeExtension theme) {
    final vinScreenVM = ref.read(vehiclesScreenVMProvider.notifier);
    return TextField(onChanged: (value) => vinScreenVM.setVIN(value));
  }

  Widget _buildSearchInputError(WidgetRef ref, CosThemeExtension theme) {
    final vinScreenVM = ref.read(vehiclesScreenVMProvider.notifier);
    final vinState = ref.read(vehiclesScreenVMProvider);

    return TextField(
      onChanged: (value) => vinScreenVM.setVIN(value),
      decoration: InputDecoration(errorText: vinState.vinError),
    );
  }

  Widget _displayResults(WidgetRef ref) {
    final vinState = ref.watch(vehiclesScreenVMProvider);

    if (vinState.vehicle != null) {
      return VehicleCard(vehicle: vinState.vehicle!);
    }

    return const SizedBox.shrink();
  }

  Widget _buildSearchButton(WidgetRef ref, CosThemeExtension theme) {
    final vinScreenVM = ref.watch(vehiclesScreenVMProvider.notifier);
    final vinState = ref.read(vehiclesScreenVMProvider);

    return StreamBuilder(
      stream: vinScreenVM.vinStream,
      builder: (context, snapshot) {
        bool isEnabled = false;
        if (snapshot.hasData) {
          final either = snapshot.data!;
          either.fold(
            (success) => isEnabled = true,
            (error) => isEnabled = false,
          );
        }

        if (vinState.isWaiting) {
          isEnabled = false;
        }

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: isEnabled ? () => vinScreenVM.search() : null,
            child: Text(cta),
          ),
        );
      },
    );
  }

  Widget _displayError(BuildContext context, WidgetRef ref) {
    final vm = ref.read(vehiclesScreenVMProvider.notifier);
    final vinState = ref.watch(vehiclesScreenVMProvider);

    if (vinState.vehicleError != null && !vinState.snackTriggered) {
      final error = vinState.vehicleError!;

      if (error.type != VehicleErrorType.notImplemented) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          vm.setSnackTriggered(true);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(error.getUserCTA()),
            duration: const Duration(seconds: 2),
          ));
        });
      }
    }

    return const SizedBox.shrink();
  }

  _displayOptionSheet(BuildContext context, WidgetRef ref) {
    final vinScreenVM = ref.watch(vehiclesScreenVMProvider.notifier);
    final vinState = ref.watch(vehiclesScreenVMProvider);

    if (vinState.options?.isNotEmpty ?? false) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return VehicleList(
                vehicles: vinState.options!,
                onSelected: (vehicle) {
                  vinScreenVM.setVehicle(vehicle);
                  Navigator.pop(context);
                });
          },
        ).whenComplete(() => vinScreenVM.clearOptions());
      });
    }

    return const SizedBox.shrink();
  }
}
