class RecommendationEntity {
  int idFood;
  String foodName;
  String ingredients;
  String steps;
  String image;
  String khasiat;
  String deskripsi;

  RecommendationEntity(
      {required this.idFood,
      required this.foodName,
      required this.ingredients,
      required this.steps,
      required this.image,
      required this.khasiat,
      required this.deskripsi});
}
