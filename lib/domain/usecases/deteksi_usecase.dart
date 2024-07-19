import 'package:healtheats/data/models/deteksi_model.dart';
import 'package:healtheats/domain/repository/deteksi_repository.dart';

class DeteksiUsecase {
  final DeteksiRepository deteksiRepository;

  DeteksiUsecase({required this.deteksiRepository});

  Future<DeteksiModel> get(List answer) async {
    try {
      return await deteksiRepository.get(answer);
    } catch (e) {
      rethrow;
    }
  }
}
