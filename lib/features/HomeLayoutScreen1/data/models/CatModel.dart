import 'dart:ui';

class CategoryModel {
  String? Image;
  String? name;
  String? id;
  Color? catColor;

  CategoryModel(this.Image, this.name, this.catColor, this.id);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          "assets/images/ball.png", "Sports", Color(0xffC91C22), "sports"),
      CategoryModel("assets/images/Politics.png", "Politics", Color(0xff003E90),
          "general"),
      CategoryModel(
          "assets/images/health.png", "Health", Color(0xffED1E79), "health"),
      CategoryModel("assets/images/bussines.png", "Business", Color(0xffCF7E48),
          "business"),
      CategoryModel("assets/images/environment.png", "Environment",
          Color(0xff4882CF), "entertainment"),
      CategoryModel(
          "assets/images/science.png", "Science", Color(0xffF2D352), "science"),
    ];
  }
}
