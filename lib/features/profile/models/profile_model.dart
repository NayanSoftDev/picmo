class ProfileModel {
  final String uid;
  final String name;
  final String profession;
  final List<String> galleryImages;
  final bool hasVideos;

  ProfileModel({
    required this.uid,
    required this.name,
    required this.profession,
    required this.galleryImages,
    required this.hasVideos,
  });

  factory ProfileModel.empty() {
    return ProfileModel(
      uid: '',
      name: '',
      profession: '',
      galleryImages: [],
      hasVideos: false,
    );
  }

  ProfileModel copyWith({
    String? uid,
    String? name,
    String? profession,
    List<String>? galleryImages,
    bool? hasVideos,
  }) {
    return ProfileModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      profession: profession ?? this.profession,
      galleryImages: galleryImages ?? this.galleryImages,
      hasVideos: hasVideos ?? this.hasVideos,
    );
  }
}