import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_round_1/base/base_viewmodel.dart';
import 'package:test_round_1/constants/constants.dart';
import 'package:test_round_1/network/dto/category_response_dto.dart';

class CategoryVM extends BaseViewModel {

  List<CategoryView> categories = List<CategoryView>.empty().obs;

  @override
  void onInit() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      getCategories();
    });
    super.onInit();
  }

  getCategories() async {
    try {
      showLoading();
      final response = await api.common.getCategories();
      categories = response.data ?? [];
      update();
      hideLoading();
    } on DioError catch (_) {
      hideLoading();
      showError(_.getErrorMessage());
    } catch (_) {
      hideLoading();
      showError(_.toString());
    }
  }

  Future<void> save() async {
    try {
      showLoading();
      await api.common.saveCategories({
        "CategoryIds[]": categories.where((e) => e.isSelected).map((e) => e.id).toList()
      }, pref.userId.toString());
      hideLoading();
      showMessage("Saved");
    } on DioError catch (_) {
      hideLoading();
      showError(_.getErrorMessage());
    } catch (_) {
      hideLoading();
      showError(_.toString());
    }
  }

  updateCategory(CategoryView categoryView) {
    categoryView.isSelected ^= true;
    update();
  }
}
