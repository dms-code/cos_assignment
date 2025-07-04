import 'package:flutter/material.dart';
import 'package:cos_assignment/domain/models/vehicles.dart';

/// A widget that displays a scrollable list of vehicles.
///
/// The `VehicleList` is responsible for rendering a list of [Vehicle] objects
/// using [VehicleOptionCard] widgets. It is typically used when a search
/// yields multiple results, allowing the user to select the correct one.
///
/// When a user taps on a vehicle in the list, the [onSelected] callback is
/// invoked with the selected [Vehicle].
/// 
class VehicleList extends StatelessWidget {
  const VehicleList({Key? key, required this.vehicles, required this.onSelected}) : super(key: key);

  final List<Vehicle> vehicles;
  final Function(Vehicle) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        return VehicleOptionCard(vehicle: vehicles[index], onSelected: onSelected);
      },
    );
  }
}

class VehicleOptionCard extends StatelessWidget {
  const VehicleOptionCard({Key? key, required this.vehicle, required this.onSelected}) : super(key: key);

  final Vehicle vehicle;
  final Function(Vehicle) onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(vehicle),
      child: Card(
        child: ListTile(
          title: Text(vehicle.make!),
          subtitle: Text(vehicle.model!),
          trailing: Text("similarity score: ${vehicle.similarity.toString()}"),
        ),
      ),
    );
  }
}