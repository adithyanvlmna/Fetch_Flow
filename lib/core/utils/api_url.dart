class ApiUrl {
  static const String baseUrl =
      "https://the-flutter-case-prod.novindus.in/api/";

  static String loadItems = "news-and-blogs";

  static String loadItemsWithId({required String id}) {
    return "/news-and-blogs-catg?page=$id";
  }

static String loadBlogDetails({required String id}) {
  return "/news-and-blogs-details/$id"; 
}

}
