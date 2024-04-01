//
//
//
//
// class _LocalAudioPlayerScreenState extends State<LocalAudioPlayerScreen> {
//   late AudioPlayer audioPlayer;
//   late Future<void> _initFuture;
//   String localFilePath = 'path_to_your_local_audio_file.mp3'; // Replace with your local audio file path
//
//   @override
//   void initState() {
//     super.initState();
//     audioPlayer = AudioPlayer();
//     _initFuture = initAudioPlayer();
//   }
//
//   Future<void> initAudioPlayer() async {
//     await audioPlayer.setFilePath(localFilePath);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Local Audio Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 await _initFuture;
//                 await audioPlayer.play();
//               },
//               child: Text('Play'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await audioPlayer.pause();
//               },
//               child: Text('Pause'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await audioPlayer.stop();
//               },
//               child: Text('Stop'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
