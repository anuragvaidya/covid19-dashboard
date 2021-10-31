class Summary {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  Summary(
      {required this.newConfirmed,
      required this.totalConfirmed,
      required this.newDeaths,
      required this.totalDeaths,
      required this.newRecovered,
      required this.totalRecovered});

  Summary.fromJson(Map<String, dynamic> json)
      : newConfirmed = json['NewConfirmed'],
        totalConfirmed = json['TotalConfirmed'],
        newDeaths = json['NewDeaths'],
        totalDeaths = json['TotalDeaths'],
        newRecovered = json['NewRecovered'],
        totalRecovered = json['TotalRecovered'];
}
