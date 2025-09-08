import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/constants/sizes.dart';

class MovieDetailsInfoShimmer extends StatelessWidget {
  const MovieDetailsInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: theme.colorScheme.surfaceContainer,
            highlightColor: theme.colorScheme.surfaceContainerHigh,
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 2,
              decoration: BoxDecoration(color: theme.colorScheme.surface),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.sm),
                Shimmer.fromColors(
                  baseColor: theme.colorScheme.surfaceContainer,
                  highlightColor: theme.colorScheme.surfaceContainerHigh,
                  child: Container(
                    width: 100,
                    height: 15,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppSizes.borderRadiusLg,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.sm),
                Shimmer.fromColors(
                  baseColor: theme.colorScheme.surfaceContainer,
                  highlightColor: theme.colorScheme.surfaceContainerHigh,
                  child: Container(
                    width: 200,
                    height: 15,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppSizes.borderRadiusLg,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.lg),
                Shimmer.fromColors(
                  baseColor: theme.colorScheme.surfaceContainer,
                  highlightColor: theme.colorScheme.surfaceContainerHigh,
                  child: Container(
                    width: 100,
                    height: 15,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppSizes.borderRadiusLg,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.sm),
                Shimmer.fromColors(
                  baseColor: theme.colorScheme.surfaceContainer,
                  highlightColor: theme.colorScheme.surfaceContainerHigh,
                  child: Container(
                    width: 200,
                    height: 15,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppSizes.borderRadiusLg,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.sm),
                Shimmer.fromColors(
                  baseColor: theme.colorScheme.surfaceContainer,
                  highlightColor: theme.colorScheme.surfaceContainerHigh,
                  child: Container(
                    width: 100,
                    height: 15,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppSizes.borderRadiusLg,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.lg),
                Shimmer.fromColors(
                  baseColor: theme.colorScheme.surfaceContainer,
                  highlightColor: theme.colorScheme.surfaceContainerHigh,
                  child: Container(
                    width: 200,
                    height: 15,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppSizes.borderRadiusLg,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
