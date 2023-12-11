import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workshop_nextapps/club/src/data/club_api.dart';
import 'package:workshop_nextapps/club/src/domain/club.dart';
import 'package:workshop_nextapps/club/src/ui/club_detail_viewmodel.dart';
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
  late final ClubDetailViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ClubDetailViewModel(clubId: widget.clubId);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, __) {
        if (viewModel.isLoading) {
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
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            title: Text(viewModel.name ?? ''),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/dropbox.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop('Popped manually');
                },
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
                  facilities: viewModel.facilities,
                ),
                FacilitiesCard(
                  facilities: viewModel.facilities,
                ),
                FacilitiesCard(
                  facilities: viewModel.facilities,
                ),
                FacilitiesCard(
                  facilities: viewModel.facilities,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
