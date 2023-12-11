import 'package:flutter/material.dart';

import '../domain/club.dart';

class FacilitiesCard extends StatelessWidget {
  final List<Facility> facilities;

  const FacilitiesCard({
    required this.facilities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:
            facilities.map((facility) => _FacilityLine(facility)).toList(),
      ),
    );
  }
}

class _FacilityLine extends StatelessWidget {
  final Facility facility;

  const _FacilityLine(this.facility);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            facility.icon.small,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text(
            facility.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
