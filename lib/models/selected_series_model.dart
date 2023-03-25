class SelectedSeriesData {
  String? name;
  String? url;

  SelectedSeriesData({
    this.name,
    this.url,
  });

  SelectedSeriesData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}
