class AllData {
  int cases;
  int deaths;
  int recovered;
  int updated;

  AllData({this.cases, this.deaths, this.recovered, this.updated});

  factory AllData.fromJson(Map<String, dynamic> json){
    return AllData(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      updated: json['updated']
    );
  }
}