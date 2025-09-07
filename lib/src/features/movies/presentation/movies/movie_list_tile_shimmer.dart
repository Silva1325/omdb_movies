
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class MovieListTileShimmer extends StatelessWidget {

  const MovieListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.surfaceContainer,
      highlightColor: theme.colorScheme.surfaceContainerHigh,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppSizes.borderRadiusLg,
            ),
          ),
        ),
      ),
    );
  }
}
