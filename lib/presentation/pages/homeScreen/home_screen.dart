import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:musick/data/datasources/song_data.dart';
import 'package:musick/data/models/song/song_model.dart';
import 'package:musick/presentation/cubits/Authentication/authentication_cubit.dart';
import 'package:musick/presentation/cubits/song/song_cubit.dart';
import 'package:musick/presentation/cubits/theme/themeMode_cubit.dart';
import 'package:musick/presentation/pages/homeScreen/favorites_screen.dart';
import 'package:musick/presentation/pages/homeScreen/playlist_screen.dart';
import 'package:musick/presentation/pages/homeScreen/profile_screen.dart';
import 'package:musick/presentation/widgets/Inputfield/search_bar.dart';
import 'package:musick/presentation/widgets/audioplayer/custom_audioplayer.dart';
import 'package:musick/presentation/widgets/buttons/dark_light_toggle_button.dart';
import 'package:musick/presentation/widgets/buttons/radiobutton_custom.dart';
import 'package:musick/presentation/widgets/song/song_list_horizontal.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../widgets/song/song_list.dart';

class HomeScreen extends StatefulWidget {
  final BuildContext authContext;
  const HomeScreen({super.key, required this.authContext});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);



  List<Widget> _buildScreens() {
    return [
      HomeScreenPage(authContext: widget.authContext,),
      PlaylistScreen(authContext: widget.authContext,),
      FavoritesScreen(authContext: widget.authContext,),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search_rounded),
        title: 'Search',
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: 'Favorites',
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(

        context,
        onItemSelected: (index){
          print(index);
          if(index==0){
            BlocProvider.of<SongCubit>(context).searchByGenreString("");
          }if(index==2){
            BlocProvider.of<SongCubit>(context).searchByGenreString("");
          }

        },
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,

        backgroundColor: Theme.of(context).colorScheme.background,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          colorBehindNavBar: Colors.white,

        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}



class HomeScreenPage extends StatefulWidget {
  final BuildContext authContext;
  const HomeScreenPage({super.key, required this.authContext});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SongCubit, List<Song>>(builder: (context, state) {
        return Stack(children: [
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hey, music lover!",
                            textAlign: TextAlign.center,
                            style: myThemePlayfair.textTheme.displaySmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w600),
                          ),
                         const DarkLightToggleButton(
                              isDarkModeOn: false),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: CustomRadio(
                          value: GenreEnum.chill,
                          groupValue: GenreEnum.chill,
                          onChanged: (current) {}),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     context.read<AuthenticationCubit>().loggedOut();
                    //   },
                    //   child: const Text("sign Out"),
                    // ),
                    // ElevatedButton(onPressed: (){
                    //   final player = AudioPlayer();
                    //   player.play(AssetSource(AppSongs.mitraz));
                    // }, child: Text("play  music")),
                    // CustomAudioPlayer(audioUrl: AppSongs.mitraz),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Discover new tunes",
                        style: myThemePlayfair.textTheme.displayLarge?.copyWith(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HorizontalSongList(songs: state, homeContext: widget.authContext ,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Hit Tracks",
                        style: myThemePlayfair.textTheme.displayLarge?.copyWith(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SongList(
                      songs: state,
                      homeContext: widget.authContext,
                    ),
                    // ElevatedButton(onPressed: (){
                    //   Navigator.pushNamed(context, "/CustomAudioPlayerScreen");
                    // }, child: Container(height: 100,width: 100,))
                  ],
                ),
              ),
            ),
          ),
        ]);
      }),
    );
  }
}
