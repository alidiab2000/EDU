// ignore_for_file: public_member_api_docs, sort_constructors_first
 import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({
    super.key,
 //   required this.scrollDirection,
  });
  // final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  //    scrollDirection: scrollDirection,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 125,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 2.6 / 4,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade600,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade600,
                          child: const CustomLoadingBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade600,
                          child: const CustomLoadingBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomLoadingBorder extends StatelessWidget {
  const CustomLoadingBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
