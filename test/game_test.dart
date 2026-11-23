import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cocuk_labirenti_ve_yapbozu/oyun_cocuk_labirenti_ve_yapbozu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(labirentYapbozConfig.title.length, 33);
    expect(labirentYapbozConfig.tagline.length, 33);
    for (final s in labirentYapbozConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(labirentYapbozConfig.gameId, labirentYapbozId);
    expect(labirentYapbozRules.gameId, labirentYapbozId);
    expect(labirentYapbozConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(labirentYapbozRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: labirentYapbozId, optionalMechanics: labirentYapbozRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(labirentYapbozRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
