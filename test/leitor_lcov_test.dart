import 'package:study_unit_test/leitor_lcov.dart';
import 'package:study_unit_test/line_report.dart';
import 'package:test/test.dart';

void main() {
  test('deve pegar porcentagem de cobertura', () async {
    final result = coverage('./coverage/lcov.info');
    expect(result, '100%');
  });

  test('deve calcular a porcentagem em 50%', () async {
    final result = calculatePercent([
      LineReport(sourceFile: '', lineFound: 18, lineHit: 9),
      LineReport(sourceFile: 'ds', lineFound: 10, lineHit: 5),
    ]);
    expect(result, 50);
  });

  test('deve calcular a porcentagem em 25%', () async {
    final result = calculatePercent([
      LineReport(sourceFile: '', lineFound: 40, lineHit: 10),
      LineReport(sourceFile: 'ds', lineFound: 80, lineHit: 20),
    ]);
    expect(result, 25);
  });

  test('deve calcular a porcentagem em 0%', () async {
    final result = calculatePercent([
      LineReport(sourceFile: '', lineFound: 0, lineHit: 0),
      LineReport(sourceFile: 'ds', lineFound: 0, lineHit: 0),
    ]);
    expect(result, 0);
  });
}
