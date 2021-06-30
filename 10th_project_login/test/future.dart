Future<void> main() async {
  print('start practice!');
  print(await firstProcess());
}

String firstProcess() {
  print('1');
  var ctr = secondProcess();
  return '$ctr';
}

Future<String> secondProcess() async {
  return await Future.delayed(Duration(seconds: 3), () {
    return '2';
  });
}
