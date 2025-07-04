import 'package:cos_assignment/domain/models/vehicles.dart';
import 'package:flutter/material.dart';


/// The `VehicleCard` is a widget that displays the details of a vehicle.
///
/// It displays the vehicle details and the feedback if available.
///
/// - **ID**: Displays the ID of the vehicle.
/// - **Price**: Displays the price of the vehicle.
/// - **Model**: Displays the model of the vehicle.
/// - **Last Sync**: Displays the last sync time of the vehicle.
/// - **Feedback**: Displays the feedback of the vehicle.

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleCard({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  String _formatPrice(int? price) {
    if (price == null) return 'N/A';
    return '\$${price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}';
  }

  String _getLastSyncText(DateTime? lastSync) {
    if (lastSync == null) return 'Never synced';
    
    final now = DateTime.now();
    final difference = now.difference(lastSync);
    
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  Widget _buildFeedbackSection() {
    if (vehicle.feedback == null || vehicle.feedback!.isEmpty) {
      return const SizedBox.shrink();
    }

    final isPositive = vehicle.feedbackSentiment ?? false;
    final feedbackText = isPositive 
        ? 'You got a positive feedback: ${vehicle.feedback}'
        : 'You got a negative feedback: ${vehicle.feedback}';

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isPositive ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isPositive ? Colors.green.shade200 : Colors.red.shade200,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isPositive ? Icons.thumb_up : Icons.thumb_down,
            color: isPositive ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              feedbackText,
              style: TextStyle(
                color: isPositive ? Colors.green.shade800 : Colors.red.shade800,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with ID and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID: ${vehicle.id ?? 'N/A'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  _formatPrice(vehicle.price),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Model
            Text(
              vehicle.model ?? 'Unknown Model',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            
            // Last Sync
            Row(
              children: [
                const Icon(
                  Icons.sync,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  'Last sync: ${_getLastSyncText(vehicle.lastSync)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            
            // Feedback Section
            _buildFeedbackSection(),
          ],
        ),
      ),
    );
  }
}
