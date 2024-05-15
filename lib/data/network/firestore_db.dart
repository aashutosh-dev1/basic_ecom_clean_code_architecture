import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/data/models/review_model.dart';

import '../models/product_model.dart';

class FirestoreDB {
  static const String shoesCollection = 'shoes';
  final FirebaseFirestore _firebaseFirestore;
  FirestoreDB({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> uploadData() async {
    var product = [
       ProductModel(
        id: "1",
        name: 'Jordan 1 Retro High Tie Dye',
        image: [
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://images.unsplash.com/photo-1605348532760-6753d2c43329?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ],
        description:
            """Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. """,
        price: 99.99,
        brandLogo: "NIKE",
        sizes: ['39', '40', '41', '42', '43'],
        colors: ['Red', 'Blue', 'Green'],
        brand: 'Nike',
        minQty: 1,
        reviews: [
          ReviewModel(
              userImage:
                  "https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?q=80&w=2334&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              userName: 'Minion',
              userReview: "This is not as good as I thought",
              userRating: 2.5),
          ReviewModel(
              userImage:
                  "https://images.unsplash.com/photo-1638643391904-9b551ba91eaa?q=80&w=2592&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              userName: 'Skywalker',
              userReview: "This is average, but not bad",
              userRating: 3.5),
        ],
      ),
       ProductModel(
        name: 'Jordan 1 Retro High Tie Dye',
        image: [
          "https://images.unsplash.com/photo-1620794341491-76be6eeb6946?q=80&w=3394&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://images.unsplash.com/photo-1560769629-975ec94e6a86?q=80&w=2898&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ],
        description:
            """Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. """,
        price: 230.00,
        brandLogo: "ADIDAS",
        minQty: 1,
        sizes: ['39', '40', '41'],
        colors: ['Red', 'Blue', 'Green'],
        brand: 'ADIDAS',
        reviews: [
          ReviewModel(
              userImage:
                  "https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?q=80&w=2334&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              userName: 'Minion',
              userReview: "This is not as good as I thought",
              userRating: 1.5),
        ],
        id: '2',
      ),
       ProductModel(
        name: 'Jordan 1 Retro High Tie Dye',
        image: [
          "https://images.unsplash.com/photo-1620794341491-76be6eeb6946?q=80&w=3394&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://images.unsplash.com/photo-1560769629-975ec94e6a86?q=80&w=2898&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ],
        minQty: 1,
        description:
            """Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. """,
        price: 30.00,
        brandLogo: "ADIDAS",
        sizes: ['39', '40', '41'],
        colors: ['Red', 'Blue', 'Green'],
        brand: 'ADIDAS',
        reviews: [
          ReviewModel(
              userImage:
                  "https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?q=80&w=2334&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              userName: 'Minion',
              userReview: "This is not as good as I thought",
              userRating: 3),
          ReviewModel(
              userImage:
                  "https://images.unsplash.com/photo-1638643391904-9b551ba91eaa?q=80&w=2592&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              userName: 'Skywalker',
              userReview: "This is average, but not bad",
              userRating: 4),
          ReviewModel(
              userImage:
                  "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=3280&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              userName: 'Jhon',
              userReview: "This is very good, I love it",
              userRating: 4),
        ],
        id: '3',
      ),
    ];
    for (var i in product) {
      await saveProductToFirestore(i);
    }
  }

  Future<void> saveProductToFirestore(ProductModel product) async {
    try {
      CollectionReference productsCollection =
          _firebaseFirestore.collection(shoesCollection);

      // Calculate average review
      double averageReview = product.averageReview;

      Map<String, dynamic> productData = {
        'name': product.name,
        'id': product.id,
        'image': product.image,
        'description': product.description,
        'price': product.price,
        'sizes': product.sizes,
        'colors': product.colors,
        'minQty': product.minQty,
        'brand': product.brand,
        'reviews': product.reviews.map((review) => review.toMap()).toList(),
        'averageReview': averageReview,
      };

      await productsCollection.add(productData);
      print('Product added to Firestore');
    } catch (e) {
      print('Error adding product to Firestore: $e');
    }
  }

  Future<List<ProductModel>> fetchProductsFromFirestore() async {
    try {
      CollectionReference productsRef =
          FirebaseFirestore.instance.collection(shoesCollection);

      QuerySnapshot querySnapshot = await productsRef.get();

      List<ProductModel> products = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return ProductModel(
          name: data['name'],
          image: List<String>.from(data['image']),
          description: data['description'],
          price: data['price'].toDouble(),
          sizes: List<String>.from(data['sizes']),
          colors: List<String>.from(data['colors']),
          brand: data['brand'],
          brandLogo: data['brandLogo'] ?? "",
          reviews: (data['reviews'] as List<dynamic>).map((reviewData) {
            return ReviewModel(
              userImage: reviewData['userImage'],
              userName: reviewData['userName'],
              userReview: reviewData['userReview'],
              userRating: reviewData['userRating'].toDouble(),
            );
          }).toList(),
          id: data['id'],
        );
      }).toList();

      return products;
    } catch (e) {
      print('Error fetching products from Firestore: $e');
      rethrow; // Rethrow the error to handle it in the calling code
    }
  }
}
