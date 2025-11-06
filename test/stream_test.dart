import 'package:study_unit_test/stream.dart';
import 'package:test/test.dart';

void main() {
  test('deve completar a requisição trazendo uma lista de nome', () {
    final stream = getStreamList();
    expect(stream, emitsInOrder(['masterclass', 'flutterando']));
  });
}
