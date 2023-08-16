import 'package:flutter/material.dart';
import 'package:hackermoondiooo/features/CRUD/presentation/view_models/create_user.dart';
import 'package:intl/intl.dart';

class NewUserDialog extends StatelessWidget {
  const NewUserDialog({
    super.key,
    required this.provider,
  });

  final NewUserProvider provider;

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormatter.formatDateTime(
    // dateTime: provider.newUser!.createdAt.toString() ?? '',
    // outputFormat: 'dd/MM/yyyy',
// );
    String apiResponse = provider.newUser!.createdAt.toString();

    // Extract the ISO 8601 date and time string from the response
    String iso8601DateTime = apiResponse.split(' ')[0];

// Parse the ISO 8601 string into a DateTime object
    DateTime parsedDateTime = DateTime.parse(iso8601DateTime);

// Format the DateTime object into a readable format
    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(parsedDateTime);

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo, // Using the primary color
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Increased padding for better spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'New User Information',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height: 10), // Adding spacing between title and content
              Text(
                'ID: ${provider.newUser?.id}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'Name: ${provider.newUser?.name}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'Job: ${provider.newUser?.job}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'Created at: ${formattedDateTime}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
