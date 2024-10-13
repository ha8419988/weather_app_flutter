import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {
  const HomeLocation({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd-MM-yyyy');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icons/location.png'),
            const SizedBox(
              width: 10,
            ),
            Text(
              location,
              style: const TextStyle(color: Colors.white, fontSize: 28),
            )
          ],
        ),
        Text(
          dateFormat.format(DateTime.now()),
          style: const TextStyle(color: Colors.white, fontSize: 28),
        )
      ],
    );
  }
}
