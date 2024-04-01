
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:musick/data/models/song/song_model.dart';
import 'package:musick/presentation/cubits/song/song_cubit.dart';
import 'package:musick/presentation/widgets/Inputfield/search_bar.dart';
import 'package:musick/presentation/widgets/song/song_list.dart';
TextEditingController songController = TextEditingController();
class PlaylistScreen extends StatefulWidget {
  final BuildContext authContext;

  const PlaylistScreen({super.key,required this.authContext});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}


class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  void dispose() {
    songController.text="";
    super.dispose();
  }
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongCubit, List<Song>>(builder: (context, state) {
      return Stack(
        children: [
          Image.network(
            state[0].backgroundUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.background,
                    Theme.of(context).colorScheme.background,
                  ],
                  stops: [0.0, 0.3, 0.3],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBarCustom(
                      controller: songController,
                      onChanged: (query) {
                        BlocProvider.of<SongCubit>(context).searchSongs(query);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: Text(
                      "Suggested Playlist",
                      style: myThemePlayfair.textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  // Wrap SongList with a SizedBox to give it a fixed height or use Expanded if you want it to take remaining space
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 200, // Adjust height according to your needs
                      child: SongList(
                        songs: state,
                        homeContext: widget.authContext,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

}
