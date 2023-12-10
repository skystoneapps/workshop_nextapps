/// Feature for anything related to the clubs of Arenal.
///
/// This is an example of a barrel file. It acts as a public API for
/// this "subpackage". Other features can import this file and use the classes that are exported.
/// It is a best practice to avoid importing files within the `src` folder, from other feature-subpackages.
library club;

/// We only export the ClubDetailScreen here.
export 'src/ui/club_detail_screen.dart';
