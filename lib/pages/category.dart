import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_round_1/network/dto/category_response_dto.dart';
import 'package:test_round_1/pages/category_vm.dart';

class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/category_background.png"),
              )),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 192.h),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(29, 34, 56, 0.13), Colors.black],
                  stops: [0.03, 0.34],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Wellcome to TalkLife",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 48.w),
                      child: Text(
                        "Please select categories what you would like to see on your feed. You can set this later on Filter.",
                        style: TextStyle(
                          height: 1.64,
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.82),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GetBuilder<CategoryVM>(
                        init: CategoryVM(),
                        builder: (vm) {
                          return GridView.builder(
                            itemCount: vm.categories.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                _ItemCategory(
                              categoryView: vm.categories[index],
                              isActive: true,
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 51,
            right: 24,
            left: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/icon_back.svg"),
                GetBuilder<CategoryVM>(
                  builder: (vm) {
                    return InkWell(
                      onTap: vm.save,
                      child: const Text(
                        "Done",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    );
                  }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCategory extends StatelessWidget {
  final CategoryView categoryView;
  final bool isActive;

  const _ItemCategory(
      {Key? key, required this.categoryView, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isActive
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF8A32A9), Color(0xFF8A00FF)],
                stops: [0.03, 0.34],
              )
            : null,
        borderRadius: BorderRadius.circular(8),
        border: !isActive
            ? Border.all(color: Colors.white.withOpacity(0.12), width: 1)
            : null,
      ),
      child: Center(
        child: Text(
          "Family",
          style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.82)),
        ),
      ),
    );
  }
}
