class CategoryModel {
  final String title;
  final String image;

  CategoryModel({
    required this.title,
    required this.image,
  });
}

final List<CategoryModel> categoriesList = [
  CategoryModel(
    title: "All",
    image: "assets/all.png",
  ),
  CategoryModel(
    title: "Shoes",
    image: "assets/shoes.png",
  ),
  CategoryModel(
    title: "Beauty",
    image: "assets/beauty.png",
  ),
  CategoryModel(
    title: "Women's\nFashion",
    image: "assets/image1.png",
  ),
  CategoryModel(
    title: "Jewelry",
    image: "assets/jewelry.png",
  ),
  CategoryModel(
    title: "Men's\nFashion",
    image: "assets/men.png",
  ),
];