import '../models/category_model.dart';

//Pexels Api
String apiKey = "563492ad6f9170000100000153538dea2e044f0ea5566f3ea0cfe53c";

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];

  CategoryModel categoryModel = new CategoryModel();

  //
  categoryModel.image_url =
      "https://images.pexels.com/photos/173301/pexels-photo-173301.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.category_name = "Street Art";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.image_url =
      "https://images.pexels.com/photos/33545/sunrise-phu-quoc-island-ocean.jpg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.category_name = "8k Wallpapers";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.image_url =
      "https://images.pexels.com/photos/3805983/pexels-photo-3805983.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.category_name = "Space";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.image_url =
      "https://images.pexels.com/photos/11889770/pexels-photo-11889770.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.category_name = "Romantic";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.image_url =
      "https://images.pexels.com/photos/248159/pexels-photo-248159.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.category_name = "Sunset";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.image_url =
      "https://images.pexels.com/photos/2534523/pexels-photo-2534523.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.category_name = "Flowers";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;
}
