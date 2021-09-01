class Country {
  String country;
  String slug;
  String iso2;

  Country({required this.country, required this.slug, required this.iso2});

  Country.fromJson(Map<String, dynamic> json)
      : country = json['Country'],
        slug = json['Slug'],
        iso2 = json['ISO2'];
}
