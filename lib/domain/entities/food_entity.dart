class FoodEntity {
  final int idFood;
  final String name;
  final String ingredients;
  final String image;
  final String steps;
  final String khasiat;
  final String type;
  final String deskripsi;
  final bool isFavorite;

  FoodEntity({
    required this.idFood,
    required this.name,
    required this.ingredients,
    required this.image,
    required this.steps,
    required this.khasiat,
    required this.type,
    required this.isFavorite,
    required this.deskripsi,
  });
}
