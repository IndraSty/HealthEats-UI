import 'package:healtheats/domain/entities/deteksi_entity.dart';

abstract class DeteksiRepository {
  Future<void> create(DeteksiEntity deteksi);
  Future<void> get(String id);
}
