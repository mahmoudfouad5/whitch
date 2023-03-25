class CategoriesData {
  String? name;

  CategoriesData({
    this.name,
  });

  CategoriesData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
