import 'package:flutter/material.dart';

class PricePerNight extends StatelessWidget {
  const PricePerNight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'price per night'.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(),
          ),
          child: const Text('540+ \$'),
        )
      ],
    );
  }
}
