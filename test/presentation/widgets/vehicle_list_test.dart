// Widget test for the vehicle list

import 'package:cos_assignment/domain/models/vehicles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cos_assignment/presentation/views/widgets/vehicle_list.dart';

void main() {
  testWidgets('VehicleList widget test', (WidgetTester tester) async {

    const mockVehicles = [
      Vehicle(id: 1, make: "Toyota", model: "Camry", price: 100, similarity: 10),
      Vehicle(id: 2, make: "Honda", model: "Civic", price: 200, similarity: 20),
    ];

    await tester.pumpWidget(MaterialApp(home: VehicleList(onSelected: (vehicle) {}, vehicles: mockVehicles)));

    expect(find.text("Camry"), findsOneWidget);
    expect(find.text("similarity score: 10"), findsOneWidget);
    expect(find.text("Civic"), findsOneWidget);
    expect(find.text("similarity score: 10"), findsOneWidget);

  });
}

