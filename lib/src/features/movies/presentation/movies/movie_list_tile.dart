
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../utils/constants/sizes.dart';
import '../../domain/omdb_movie.dart';

class MovieListTile extends StatelessWidget {

  final OMDBMovie movie;
  final Function() onTap;


  const MovieListTile({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSizes.borderRadiusLg,
          ),
        ),
        child: ClipRRect(
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
        ),
      ),
    );
  }
}
