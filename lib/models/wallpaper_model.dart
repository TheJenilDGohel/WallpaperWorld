// ignore_for_file: public_member_api_docs, sort_constructors_first

class WallpaperModel {
  late String photographer;
  late String photographer_url;
  late int photographer_id;
  late SrcModel srcModel;

  WallpaperModel(
      {required this.photographer,
      required this.photographer_url,
      required this.photographer_id,
      required this.srcModel});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        srcModel: SrcModel.fromMap(jsonData["src"]),
        photographer: jsonData["photographer"],
        photographer_url: jsonData["photographer_url"],
        photographer_id: jsonData["photographer_id"]);
  }
}

class SrcModel {
  late String original;
  late String small;
  late String portrait;

  SrcModel({
    required this.original,
    required this.small,
    required this.portrait,
  });

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        original: jsonData["original"],
        small: jsonData["small"],
        portrait: jsonData["portrait"]);
  }
}
