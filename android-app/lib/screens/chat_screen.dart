import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pe_talk/constants.dart';
import 'package:pe_talk/controllers/avatar_controller.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  double size = 20.0;

  List<String> messages = [
    '...',
    '.....',
    '....',
    'Hello',
    'Dude',
    '...',
    '.....',
    'I am Hungry',
    '...',
    '.....',
  ];

  int message = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AvatarController>(
        builder: (context, avatarController, child) {
      return Scaffold(
        backgroundColor: mainClr,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Meoww',
                style: TextStyle(
                  color: white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: PlayButton(
                      pauseIcon: const Icon(Icons.pause,
                          color: Colors.black, size: 90),
                      playIcon: const Icon(Icons.play_arrow,
                          color: Colors.black, size: 90),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        messages[message],
                        textStyle: const TextStyle(
                          color: white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1000,
                    pause: const Duration(milliseconds: 100),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                    onNext: (index, stop) {
                      setState(() {
                        message = (message + 1) % messages.length;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}

class PlayButton extends StatefulWidget {
  final bool initialIsPlaying;
  final Icon playIcon;
  final Icon pauseIcon;
  final VoidCallback onPressed;

  const PlayButton({
    super.key,
    required this.onPressed,
    this.initialIsPlaying = true,
    this.playIcon = const Icon(Icons.play_arrow),
    this.pauseIcon = const Icon(Icons.pause),
  });

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with TickerProviderStateMixin {
  static const _kToggleDuration = Duration(milliseconds: 300);
  static const _kRotationDuration = Duration(seconds: 5);

  bool? isPlaying = true;

  // rotation and scale animations
  AnimationController? _rotationController;
  AnimationController? _scaleController;
  double _rotation = 0;
  double _scale = 0.85;

  bool get _showWaves => true; //!_scaleController!.isDismissed;

  void _updateRotation() => _rotation = _rotationController!.value * 2 * pi;
  void _updateScale() => _scale = (_scaleController!.value * 0.2) + 0.85;

  @override
  void initState() {
    isPlaying = widget.initialIsPlaying;
    _rotationController =
        AnimationController(vsync: this, duration: _kRotationDuration)
          ..addListener(() => setState(_updateRotation))
          ..repeat();

    _scaleController =
        AnimationController(vsync: this, duration: _kToggleDuration)
          ..addListener(() => setState(_updateScale));
    Future.delayed(const Duration(seconds: 1)).then((value) => _onToggle());
    super.initState();
  }

  void _onToggle() {
    setState(() => isPlaying = !isPlaying!);

    if (_scaleController!.isCompleted) {
      _scaleController!.reverse();
    } else {
      _scaleController!.forward();
    }

    widget.onPressed();
  }

  Widget _buildIcon(bool isPlaying) {
    return SizedBox.expand(
      key: ValueKey<bool>(isPlaying),
      child: GestureDetector(
        onTap: _onToggle,
        child: Container(
          height: 210.0,
          width: 210.0,
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: white),
            shape: BoxShape.circle,
          ),
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: const BoxDecoration(
              // border: Border.all(width: 4, color: mainClr),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 130.0,
                    width: 130.0,
                    child: Image.asset(
                      getImage('cat_ava'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const Text(
                    "Puffy",
                    // avatarController.name == ""
                    //     ? 'Puffy'
                    //     : avatarController.name,
                    style: TextStyle(
                      color: mainClr,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (true) ...[
            Blob(
                color: const Color(0xff0092ff),
                scale: _scale,
                rotation: _rotation),
            Blob(
                color: const Color(0xff4ac7b7),
                scale: _scale,
                rotation: _rotation * 2 - 30),
            Blob(
                color: const Color(0xffa4a6f6),
                scale: _scale,
                rotation: _rotation * 3 - 45),
          ],
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: AnimatedSwitcher(
              duration: _kToggleDuration,
              child: _buildIcon(isPlaying!),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scaleController!.dispose();
    _rotationController!.dispose();
    super.dispose();
  }
}

class Blob extends StatelessWidget {
  final double rotation;
  final double scale;
  final Color color;

  const Blob(
      {super.key, required this.color, this.rotation = 0, this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(150),
              topRight: Radius.circular(240),
              bottomLeft: Radius.circular(220),
              bottomRight: Radius.circular(180),
            ),
          ),
        ),
      ),
    );
  }
}
