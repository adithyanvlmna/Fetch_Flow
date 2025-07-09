class ApiUrl {
  static const String baseUrl = " https://dummyjson.com";

  static const String loadProducts = "/products";

  static String loadProductWithid({required String id}) {
    return "/products/{$id} ";
  }
}
