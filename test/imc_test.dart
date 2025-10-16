import 'package:study_unit_test/imc.dart';
import 'package:test/test.dart';

void main() {
  //ciclos de vida
  setUp(() => null);
  tearDown(() => null);
  setUpAll(() => null);
  tearDownAll(() => null);

  test('Deve efetuar o calculo do IMC', () {
    //arrange
    final peso = 64.0;
    final altura = 1.78;
    //act
    final result = calcIMC(altura: altura, peso: peso);
    //assert
    expect(result, equals(20.199469763918696));
    expect(result, isA<double>());
    expect(result, greaterThan(20));
    expect(result, isPositive);
    expect(result.toString(), matches(RegExp(r'\d')));
  });

  group('Excessões de parametros |', () {
    test('Deve lançar um excessão se altura for menor que 1', () {
      expect(() => calcIMC(altura: 0, peso: 64), throwsA(isA<Exception>()));
    });

    test('Deve lançar um excessão se peso for menor que 1', () {
      expect(() => calcIMC(altura: 1.78, peso: 0), throwsA(isA<Exception>()));
    });
  });
}
