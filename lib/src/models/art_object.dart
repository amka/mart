class ArtObject {
  final int id;
  final bool isHighlight;
  final String primaryImageSmall;
  final String title;
  final String artistDisplayName;

  ArtObject({
    required this.id,
    required this.isHighlight,
    required this.primaryImageSmall,
    required this.title,
    required this.artistDisplayName,
  });

  factory ArtObject.fromJson(Map<String, dynamic> json) => ArtObject(
        id: json['objectId'] as int,
        title: json['title'],
        artistDisplayName: json['artistDisplayName'],
        primaryImageSmall: json['primaryImageSmall'],
        isHighlight: json['displisHighlightayName'] as bool,
      );
}
