// To parse this JSON data, do
//
//     final characters = charactersFromJson(jsonString);

import 'dart:convert';

List<Characters> charactersFromJson(String str) => List<Characters>.from(json.decode(str).map((x) => Characters.fromJson(x)));

String charactersToJson(List<Characters> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Characters {
    final int id;
    final String name;
    final String description;
    final String modified;
    final String resourceUri;
    final List<Url> urls;
    final Thumbnail thumbnail;
    final Comics comics;
    final Stories stories;
    final Comics events;
    final Comics series;

    Characters({
        this.id,
        this.name,
        this.description,
        this.modified,
        this.resourceUri,
        this.urls,
        this.thumbnail,
        this.comics,
        this.stories,
        this.events,
        this.series,
    });

    Characters copyWith({
        int id,
        String name,
        String description,
        String modified,
        String resourceUri,
        List<Url> urls,
        Thumbnail thumbnail,
        Comics comics,
        Stories stories,
        Comics events,
        Comics series,
    }) =>
        Characters(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            modified: modified ?? this.modified,
            resourceUri: resourceUri ?? this.resourceUri,
            urls: urls ?? this.urls,
            thumbnail: thumbnail ?? this.thumbnail,
            comics: comics ?? this.comics,
            stories: stories ?? this.stories,
            events: events ?? this.events,
            series: series ?? this.series,
        );

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        comics: Comics.fromJson(json["comics"]),
        stories: Stories.fromJson(json["stories"]),
        events: Comics.fromJson(json["events"]),
        series: Comics.fromJson(json["series"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
        "thumbnail": thumbnail.toJson(),
        "comics": comics.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
        "series": series.toJson(),
    };
}

class Comics {
    final int available;
    final int returned;
    final String collectionUri;
    final List<ComicsItem> items;

    Comics({
        this.available,
        this.returned,
        this.collectionUri,
        this.items,
    });

    Comics copyWith({
        int available,
        int returned,
        String collectionUri,
        List<ComicsItem> items,
    }) =>
        Comics(
            available: available ?? this.available,
            returned: returned ?? this.returned,
            collectionUri: collectionUri ?? this.collectionUri,
            items: items ?? this.items,
        );

    factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(json["items"].map((x) => ComicsItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class ComicsItem {
    final String resourceUri;
    final String name;

    ComicsItem({
        this.resourceUri,
        this.name,
    });

    ComicsItem copyWith({
        String resourceUri,
        String name,
    }) =>
        ComicsItem(
            resourceUri: resourceUri ?? this.resourceUri,
            name: name ?? this.name,
        );

    factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
    };
}

class Stories {
    final int available;
    final int returned;
    final String collectionUri;
    final List<StoriesItem> items;

    Stories({
        this.available,
        this.returned,
        this.collectionUri,
        this.items,
    });

    Stories copyWith({
        int available,
        int returned,
        String collectionUri,
        List<StoriesItem> items,
    }) =>
        Stories(
            available: available ?? this.available,
            returned: returned ?? this.returned,
            collectionUri: collectionUri ?? this.collectionUri,
            items: items ?? this.items,
        );

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class StoriesItem {
    final String resourceUri;
    final String name;
    final String type;

    StoriesItem({
        this.resourceUri,
        this.name,
        this.type,
    });

    StoriesItem copyWith({
        String resourceUri,
        String name,
        String type,
    }) =>
        StoriesItem(
            resourceUri: resourceUri ?? this.resourceUri,
            name: name ?? this.name,
            type: type ?? this.type,
        );

    factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
    };
}

class Thumbnail {
    final String path;
    final String extension;

    Thumbnail({
        this.path,
        this.extension,
    });

    Thumbnail copyWith({
        String path,
        String extension,
    }) =>
        Thumbnail(
            path: path ?? this.path,
            extension: extension ?? this.extension,
        );

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
    };
}

class Url {
    final String type;
    final String url;

    Url({
        this.type,
        this.url,
    });

    Url copyWith({
        String type,
        String url,
    }) =>
        Url(
            type: type ?? this.type,
            url: url ?? this.url,
        );

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}
