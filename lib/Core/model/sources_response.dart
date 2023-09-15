class SourcesResponseManual {
  String? status;
  List<Source>? sources;
}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  fromJson(Map<String, dynamic> json) {
    return Source(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"]);
  }

  Source.frojson(Map<String, dynamic> json)
      : this(
            name: json["name"],
            description: json["description"],
            url: json["url"],
            category: json["category"],
            language: json["language"],
            country: json["country"]);

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "url": url,
      "category": category,
      "language": language,
      "country": country
    };
  }
}
