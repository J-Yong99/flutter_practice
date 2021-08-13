import 'package:flutter/material.dart';

import '../main.dart';

Inout _var = Inout.Out;

class Clothes extends StatefulWidget {
  const Clothes({Key? key}) : super(key: key);

  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  List<Money> _incomeList = [];
  Money? tmp;
  late Money tmp2;
  List<Money> _outgoingList = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clothes'),
          backgroundColor: Colors.blueGrey,
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.money),
              child: Text('Income'),
            ),
            Tab(
              icon: Icon(Icons.sell_outlined),
              child: Text('Outgoing'),
            ),
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(Icons.home))
          ],
        ),
        body: Stack(children: [
          TabBarView(
            children: [
              ListView(
                children: _incomeList
                    .map((e) => ListTile(
                          trailing: IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () {
                              setState(() {
                                deleteList(_incomeList, e);
                              });
                            },
                          ),
                          title: Text(
                              'in:${e.inorout},cost:${e.cost}, date:${e.date}, memo:${e.memo}'),
                        ))
                    .toList(),
              ),
              ListView(
                children: _outgoingList
                    .map((e) => ListTile(
                          trailing: IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () {
                              setState(() {
                                deleteList(_outgoingList, e);
                              });
                            },
                          ),
                          title: Text(
                              'in:${e.inorout},cost:${e.cost}, date:${e.date}, memo:${e.memo}'),
                        ))
                    .toList(),
              ),
            ],
          ),
          Positioned(
              bottom: 10.0,
              right: 167.0,
              child: IconButton(
                  color: Colors.grey[600],
                  iconSize: 60.0,
                  onPressed: () async {
                    tmp = await inputCost(context).then((value) => (value));
                    if (tmp != null) {
                      if (tmp!.inorout == Inout.In) {
                        setState(() {
                          clothes += int.parse(tmp!.cost!);
                          _incomeList.insert(0, tmp!);
                        });
                      }

                      if (tmp!.inorout == Inout.Out) {
                        setState(() {
                          clothes -= int.parse(tmp!.cost!);
                          _outgoingList.insert(0, tmp!);
                        });
                      }
                    }
                  },
                  icon: Icon(Icons.add)))
        ]),
      ),
    );
  }

  void deleteList(List<Money> mList, Money val) {
    mList.remove(val);
  }

  Future<Money?> inputCost(BuildContext context) async {
    var tmp = await showDialog<List>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Enter cost',
              textAlign: TextAlign.center,
            ),
            content: Form(
              key: _formKey,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Income'),
                    leading: Radio<Inout>(
                      value: Inout.In,
                      groupValue: _var,
                      onChanged: (Inout? val) {
                        setState(() {
                          _var = val!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Outgoing'),
                    leading: Radio<Inout>(
                      value: Inout.Out,
                      groupValue: _var,
                      onChanged: (Inout? val) {
                        setState(() {
                          _var = val!;
                        });
                      },
                    ),
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Date EX: 08/11'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: controller2,
                    decoration: InputDecoration(labelText: 'Cost EX : 10000'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: controller3,
                    decoration: InputDecoration(labelText: 'Memo'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, [
                        controller.text,
                        controller2.text,
                        controller3.text,
                        _var
                      ]);
                    }
                  },
                  child: Text('done'))
            ],
          );
        }).then((value) {
      return value;
    });
    if (tmp?[0] != null && tmp?[1] != null && tmp?[2] != null) {
      final buf = Money(_var, tmp?[0], tmp?[1], tmp?[2]);
      resetController(controller, controller2, controller3);
      return buf;
    }
    return null;
  }

  void resetController(
    TextEditingController con,
    TextEditingController con2,
    TextEditingController con3,
  ) {
    con.text = '';
    con2.text = '';
    con3.text = '';
  }
}
