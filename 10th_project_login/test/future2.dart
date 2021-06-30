void main() async {
  await methodB();
  print('hm');
  methodA();
}

methodA() {
  print('a');
}

methodB() {
  print('b');
  methodC();
}

methodC() async {
  var c = await Future.delayed(Duration(seconds: 3), () {
    return 'c';
  });

  print(c);
}
