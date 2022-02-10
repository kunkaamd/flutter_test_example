import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_round_1/base/base_viewmodel.dart';
import 'package:test_round_1/network/dto/category_response_dto.dart';

class CategoryVM extends BaseViewModel {
  List<CategoryView> categories = List<CategoryView>.empty().obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    try {
      showLoading();
      final response = await api.common.getCategories();
      categories.assignAll(response.data ?? []);
      hideLoading();
    } on DioError catch (_) {
      hideLoading();
      showError(_.message);
    } catch (_) {
      hideLoading();
      showError(_.toString());
    }
  }

  void save() {
    try {
      showLoading();
      api.common.saveCategories({
        "CategoryIds[]": categories.map((e) => e.id).toList()
      }, pref.userId.toString());
      hideLoading();
    } on DioError catch (_) {
      hideLoading();
      showError(_.message);
    } catch (_) {
      hideLoading();
      showError(_.toString());
    }
  }
}
