
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../utils/constants/sizes.dart';
import '../../domain/omdb_movie.dart';

class MovieListTile extends StatelessWidget {

  final OMDBMovie movie;
  const MovieListTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppSizes.borderRadiusLg,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: movie.poster ?? '',
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Container(
          color: theme.colorScheme.surfaceContainer,
        ),
      ),
    );
  }
}
