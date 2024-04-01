import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:musick/data/models/song/song_model.dart';
import 'package:musick/presentation/cubits/song/song_cubit.dart';
import 'package:musick/presentation/widgets/song/song_list.dart';

class FavoritesScreen extends StatefulWidget {
  final BuildContext authContext;
  const FavoritesScreen({super.key, required this.authContext});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SongCubit, List<Song>>(
      listener: (context, state) {
        // Add listener logic here if needed
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Your Favorite songs",
                      style: myThemePlayfair.textTheme.displayLarge?.copyWith(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SongList(
                    songs: state.where((song) => song.isFavorite).toList(),
                    homeContext: widget.authContext,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
