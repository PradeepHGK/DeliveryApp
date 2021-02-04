class Categories {
  String name;
  int id;
  String thumbnailURL;
  String color;
  Categories(this.name, this.id, this.thumbnailURL, this.color);
}

List<Categories> categoryList = [
  Categories("Vegetables", 0, "images/categoryThumbnail/fruits-vegetables.jpg",
      "#F1FFA6"),
  Categories(
      "Fast-Food", 1, "images/categoryThumbnail/fastfood.jpg", "#F7B748"),
  Categories("Snacks", 2, "images/categoryThumbnail/snacks.jpg", "#AEE0FF"),
  Categories("Fruits", 3, "images/categoryThumbnail/fruits.jpg", "#FBD0DA"),
  Categories("Dairy", 4, "images/categoryThumbnail/dairy.jpg", "#FDEBC8"),
];
