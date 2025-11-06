import 'package:study_unit_test/future.dart';
import 'package:test/test.dart';

void main() {
  test('deve completar a requisição trazendo uma lista de nome', () async {
    final future = getFutureList();

    expect(future, completes);
  });
}
