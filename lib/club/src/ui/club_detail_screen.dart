import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workshop_nextapps/club/src/data/club_api.dart';
import 'package:workshop_nextapps/club/src/domain/club.dart';
import 'package:workshop_nextapps/i18n/i18n.dart';

import 'facilities.dart';

class ClubDetailScreen extends StatefulWidget {
  final int clubId;

  const ClubDetailScreen({
    super.key,
    required this.clubId,
  });

  @override
  State<ClubDetailScreen> createState() => _ClubDetailScreenState();
}

class _ClubDetailScreenState extends State<ClubDetailScreen> {
  late Future<Club> _dataLoader;

  @override
  void initState() {
    super.initState();
    // TODO move this to a viewmodel
    _dataLoader = _fetchData();
  }

  Future<Club> _fetchData() async {
    return ClubApi().getClub(widget.clubId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Club>(
      future: _dataLoader,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // TODO extract this to a loading widget
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(WorkshopLocalization.of(context).loading),
                ],
              ),
            ),
          );
        }
        final data = snapshot.requireData;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            title: Text(data.name),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/dropbox.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              // align all children to the left (in LTR languages)
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  WorkshopLocalization.of(context).facilities,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                FacilitiesCard(
                  facilities: data.facilities,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
