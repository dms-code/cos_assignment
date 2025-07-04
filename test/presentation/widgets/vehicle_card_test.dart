// Widget test for the vehicle card

import 'package:cos_assignment/domain/models/vehicles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cos_assignment/presentation/views/widgets/vehicle_card.dart';

void main() {
  testWidgets('VehicleCard widget test', (WidgetTester tester) async {

    const mockVehicle = Vehicle(id: 1, make: "Toyota", model: "Camry", price: 100, similarity: 10);

    await tester.pumpWidget(
      const MaterialApp(
        home: VehicleCard(vehicle: mockVehicle)
      )
    );

    expect(find.text("Camry"), findsOneWidget);
    expect(find.text("\$100"), findsOneWidget);

  });
}
