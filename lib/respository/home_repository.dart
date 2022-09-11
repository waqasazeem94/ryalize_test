import '../constants/app_url.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../models/anime_list_model.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<AnimeListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.animeListUrl);
      return response = AnimeListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}