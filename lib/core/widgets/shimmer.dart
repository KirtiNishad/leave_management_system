import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 0.34.sw,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 0.25.sw,
                  height: 0.35.sw,
                  // height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 0.65.sw,
                        height: 0.06.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey,
                    ),),
                    4.verticalSpace,
                    Container(
                      width: 0.65.sw,
                      height: 0.06.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey,
                      ),),
                    4.verticalSpace,
                    Container(
                      width: 0.65.sw,
                      height: 0.06.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey,
                      ),),
                    4.verticalSpace,
                    Container(
                      width: 0.65.sw,
                      height: 0.06.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey,
                      ),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
