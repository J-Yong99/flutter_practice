import 'dart:math';

const int lotto_size = 6;

void main() {
  List<int> today_lotto = lottoMachine();
  List<int> my_number = lottoMachine();
  print('내가 산 로또 번호 = $my_number');
  print('당첨 번호 = $today_lotto');
  check_Number(today_lotto, my_number);
  var test = (List<int>.generate(10, (x) => x * 2)..shuffle()).sublist(0, 6);
  // test..shuffle();
  print(test);
}

List<int> lottoMachine() {
  late Set<int> lotto = {};
  var num;
  var random = Random();
  while (lotto.length != lotto_size + 1) {
    num = random.nextInt(45) + 1;
    lotto.add(num);
  }
  return lotto.toList();
}

void check_Number(List<int> a, List<int> b) {
  int count = 0;
  List<int> check = [];
  for (int l_num in a) {
    for (int m_num in b) {
      if (l_num == m_num) {
        count++;
        check.add(l_num);
      }
    }
  }
  if (count != 0) {
    print('같은 번호는 $count개이고, $check입니다');
  } else {
    print('아쉽지만 같은 번호가 없습니다');
  }
}
