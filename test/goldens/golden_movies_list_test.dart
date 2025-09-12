
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:omdb_movies/main.dart';
import 'package:omdb_movies/src/features/movies/data/movies_repository/movies_repository.dart';
import '../robot.dart';


void main() {
  const int page = 1;
  const String query = '';
  const PlotType plotType = PlotType.short;

  setUpAll(() {
    registerFallbackValue((page: page, query: query));
    registerFallbackValue(plotType);
  });

  testWidgets('Golden - Movies List', (tester) async {
    final r = Robot(tester);
    await r.goldenRobot.loadRobotoFont();
    await r.goldenRobot.loadMaterialIconFont();
    await mockNetworkImages(() async {
      await r.pumpMyApp();
      //await r.goldenRobot.precacheImages();
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('movies_list.png'),
      );
    });
  });
}
