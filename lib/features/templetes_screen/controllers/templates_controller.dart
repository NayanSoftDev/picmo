class TemplateModel {
  final String title;
  final String image;
  final int uses;

  TemplateModel({
    required this.title,
    required this.image,
    required this.uses,
  });
}

class TemplatesController {
  List<TemplateModel> templates = [
    TemplateModel(
        title: "Anime Blast", image: "assets/images/Img1.png", uses: 2542),
    TemplateModel(
        title: "Cartoon 2.0", image: "assets/images/Img2.png", uses: 2542),
    TemplateModel(
        title: "Cyberpunk", image: "assets/images/Img3.png", uses: 2542),
    TemplateModel(
        title: "Nature", image: "assets/images/Img4.png", uses: 2542),
  ];
}
