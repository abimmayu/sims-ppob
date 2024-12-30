class MyBanner {
  final String bannerName;
  final String bannerImage;
  final String description;

  MyBanner({
    required this.bannerName,
    required this.bannerImage,
    required this.description,
  });

  factory MyBanner.fromJson(Map<String, dynamic> json) {
    return MyBanner(
      bannerName: json['banner_name'],
      bannerImage: json['banner_image'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banner_name': bannerName,
      'banner_image': bannerImage,
      'description': description,
    };
  }
}
