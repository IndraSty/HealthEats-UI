import 'package:healtheats/data/models/recommendation_model.dart';
import 'package:healtheats/domain/entities/deteksi_entity.dart';

class DeteksiModel extends DeteksiEntity {
  DeteksiModel(
      {required super.message,
      required super.penyakit,
      required super.persentase,
      required super.description,
      required super.recommendations,
      required super.id});

  factory DeteksiModel.fromJson(Map<String, dynamic> json) {
    return DeteksiModel(
      id: json['id'] ?? 0,
      message: json['message'] ?? '',
      penyakit: json['penyakit'] ?? '',
      persentase: json['persentase'] ?? '',
      description: json['description'] ?? '',
      recommendations: (json['recommendations'] as List?)
              ?.map((i) => RecommendationModel.fromJson(i))
              .toList() ??
          [],
    );
  }

  factory DeteksiModel.castFromEntity(DeteksiEntity entity) {
    return DeteksiModel(
      id: entity.id,
      message: entity.message,
      penyakit: entity.penyakit,
      persentase: entity.persentase,
      description: entity.description,
      recommendations: entity.recommendations
          .map((rec) => RecommendationModel.fromEntity(rec))
          .toList(),
    );
  }
}
