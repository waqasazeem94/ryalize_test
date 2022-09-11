import 'package:ryalize_test/models/anime_list_model.dart';
import 'package:ryalize_test/viewmodel/base_viewmodel.dart';

import '../data/response/api_response.dart';
import '../respository/home_repository.dart';

class HomeViewModel extends BaseViewModel {
  final _myRepo = HomeRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ApiResponse<AnimeListModel> animeList = ApiResponse.loading();

  setMoviesList(ApiResponse<AnimeListModel> response) {
    animeList = response;
    notifyListeners();
  }

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void onModelReady() {
    fetchMoviesListApi();
  }

  void onModelDestroy() {}

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}