import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  RxBool isPlaying = false.obs;
  RxDouble progress = 0.0.obs;
  RxBool isVideoInitialized = false.obs;
  RxString positionText = '00:00'.obs;
  RxString durationText = '00:00'.obs;

  @override
  void onInit() {
    super.onInit();

    /// Load your video here
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    )..initialize().then((_) {
        isVideoInitialized.value = true;
        durationText.value = _formatDuration(videoPlayerController.value.duration);
      });

    videoPlayerController.addListener(() {
      final value = videoPlayerController.value;
      if (value.isInitialized) {
        progress.value = value.duration.inMilliseconds > 0
            ? value.position.inMilliseconds / value.duration.inMilliseconds
            : 0.0;
        positionText.value = _formatDuration(value.position);
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  void playPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
