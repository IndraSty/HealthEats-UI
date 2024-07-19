import 'package:healtheats/data/models/deteksi_model.dart';

abstract class DeteksiRepository {
  Future<DeteksiModel> get(List answer);
}
