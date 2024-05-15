import 'package:shoesly/data/models/product_model.dart';

import '../../data/network/firestore_db.dart';

abstract class FetchDataRepository {
  Future<List<ProductModel>> fetchData();
}

class FetchDataRepositoryImpl implements FetchDataRepository {
  @override
  Future<List<ProductModel>> fetchData() async {
    return await FirestoreDB().fetchProductsFromFirestore();
  }
}