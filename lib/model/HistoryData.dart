// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'dart:convert';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
    String country;
    Timeline timeline;

    History({
        this.country,
        this.timeline,
    });

    factory History.fromJson(Map<String, dynamic> json) => History(
        country: json["country"],
        timeline: Timeline.fromJson(json["timeline"]),
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "timeline": timeline.toJson(),
    };
}

class Timeline {
    Map<String, int> cases;
    Map<String, int> deaths;

    Timeline({
        this.cases,
        this.deaths,
    });

    factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        cases: Map.from(json["cases"]).map((k, v) => MapEntry<String, int>(k, v)),
        deaths: Map.from(json["deaths"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "cases": Map.from(cases).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "deaths": Map.from(deaths).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
