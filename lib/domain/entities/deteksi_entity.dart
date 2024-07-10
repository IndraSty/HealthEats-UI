import 'package:healtheats/domain/entities/recommendation_entity.dart';

class DeteksiEntity {
  int id;
  String message;
  String penyakit;
  String persentase;
  String description;
  List<RecommendationEntity> recommendations;

  DeteksiEntity(
      {required this.id,
      required this.message,
      required this.penyakit,
      required this.persentase,
      required this.description,
      required this.recommendations});
}
