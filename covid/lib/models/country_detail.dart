class CountryDetail {
  String country;
  String lat;
  String lon;
  int confirmed;
  int deaths;
  int recovered;
  int active;

  CountryDetail({
    required this.country,
    required this.lat,
    required this.lon,
    required this.confirmed,
    required this.deaths,
    required this.recovered,
    required this.active,
  });

  CountryDetail.fromJson(Map<String, dynamic> json)
      : country = json['Country'],
        lat = json['Lat'],
        lon = json['Lon'],
        confirmed = json['Confirmed'],
        deaths = json['Deaths'],
        recovered = json['Recovered'],
        active = json['Active'];
}
