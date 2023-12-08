// import 'package:audio_service/audio_service.dart';
// import 'package:just_audio/just_audio.dart';
//
// Future<AudioHandler> initAutoService() async {
//   return await AudioService.init(
//       builder: () => MyAudioHandler(),
//       config: AudioServiceConfig(
//           androidNotificationChannelId: "com.example.delete_all_widget_demo",
//           androidNotificationChannelName: "Media Notification Demo",
//           androidResumeOnClick: true,
//           androidStopForegroundOnPause: true));
// }
//
// class MyAudioHandler extends BaseAudioHandler {
//   final _player = AudioPlayer();
//   final _playlist = ConcatenatingAudioSource(children: []);
//
//   MyAudioHandler() {
//     _loadEmptyPlaylist();
//   }
//   _loadEmptyPlaylist() async {
//     try {
//       await _player.setAudioSource(_playlist);
//     } catch (e) {}
//   }
// }
