import 'dart:io';

void main() {
  showData();
}

void showData() async {
  startTask();
  String? account = await accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '요청수행 시작';
  print(info1);
}

Future<String?> accessData() async {
  String? account = '7000';

  Duration time = Duration(seconds: 0);
  if (time.inSeconds > 2) {
    //sleep(time);
    await Future.delayed(time, () {
      account = '8500';
      print(account);
    });
  } else {
    String info2 = '데이터에 가져왔습니다';
    print(info2);
  }

  print('load');
  return account;
}

void fetchData(String? account) {
  String info3 = '잔액은 $account원 입니다';
  print('part time');
  print(info3);
}
