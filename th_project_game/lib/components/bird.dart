import 'package:flame/anchor.dart';
import 'package:flame/components/animation_component.dart';

import '../main.dart';

final double BIRD_W = 52;
final double BIRD_H = 36.7;
final double GRAVITY = 100;

class Bird extends AnimationComponent {
  Bird()
      : super.sequenced(BIRD_W, BIRD_H, 'bird.png', 3,
            textureWidth: 17, textureHeight: 12);

  double timepassed = 0.0;

  @override
  void update(double t) {
    // TODO: implement update
    super.update(t);
    timepassed += t;
    this.anchor = Anchor.center;
    this.y = (GRAVITY * timepassed * timepassed) / 2;
    this.x = size.width / 2;
    //print(timepassed);
  }

  void onTap() {
    this.y = 0.0;
    this.timepassed = 0.0;
    print('tap');
  }
}
