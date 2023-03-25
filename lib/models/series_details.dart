class SeriesDetails {
  List<String>? ename;
  List<String>? epsnon;
  List<String>? rates;

  SeriesDetails({this.ename, this.epsnon, this.rates});

  SeriesDetails.fromJson(Map<String, dynamic> json) {
    ename = json['ename'].cast<String>();
    epsnon = json['epsnon'].cast<String>();
    rates = json['rates'].cast<String>();
  }

  Map<String, dynamic> toMap() {
    return {
      'ename': ename,
      'epsnon': epsnon,
      'rates': rates,
    };
  }
}
