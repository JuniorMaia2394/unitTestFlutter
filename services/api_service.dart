import 'package:uno/uno.dart';

import '../model/Product.dart';

class ApiService {
  final Uno uno;
  ApiService(this.uno);

  Future<List<Product>> getProducts() async {
    try {
      final response = await uno.get('/product');
      final list = response.data as List;
      return list.map((e) => Product.fromjson(e)).toList();
    } on UnoError {
      return [];
    }
  }
}
