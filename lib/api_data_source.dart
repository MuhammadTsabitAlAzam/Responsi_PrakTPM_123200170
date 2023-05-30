import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> LoadNews(String kategori) {
    return BaseNetwork.get(kategori);
  }

// Future<Map<String, dynamic>> LoadDetailUsers(int idDeterima) {
//   String id = idDeterima.toString();
//   return BaseNetwork.get('users/$id');
// }
}
