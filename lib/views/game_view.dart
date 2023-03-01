import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kod_client/components/loader.dart';
import 'package:kod_client/components/number_picker.dart';
import 'package:kod_client/components/picked_number.dart';
import 'package:kod_client/components/player.dart';
import 'package:kod_client/components/submit_button.dart';
import 'package:kod_client/components/timer.dart';

import 'package:kod_client/model/event.dart';
import 'package:kod_client/model/event_types.dart';
import 'package:kod_client/model/pick.dart';
import 'package:kod_client/model/player.dart';
import 'package:kod_client/model/player_info.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late final WebSocketChannel channel;
  late final StreamSubscription<dynamic> streamSub;
  late final String selfID;
  int selfScore = 0;
  int pickedNumber = 0;

  Set<Player> players = <Player>{};
  bool sended = false;
  bool gameStarted = false;

  String? errorMessage;

  void initSession() async {
    channel =
        WebSocketChannel.connect(Uri.parse("ws://localhost:8080/session"));
    streamSub = channel.stream
        .listen(onData, onError: onError, onDone: onDone, cancelOnError: true);
    const Uuid uuid = Uuid();
    selfID = uuid.v4();
    channel.sink.add(PLayerInfo(selfID).toData());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initSession();
    });
  }

  void onData(dynamic data) {
    debugPrint(data);
    var decoded = jsonDecode(data);
    var ev = Event.fromJson(decoded);

    switch (ev.type) {
      case EventType.playerJoined:
        List<Player> newPlayers = <Player>[];
        ev.players?.forEach((p) {
          if (p.id == selfID) {
            return;
          }
          newPlayers.add(p);
        });
        setState(() {
          players.addAll(newPlayers);
        });
        break;
      case EventType.startTurn:
        if (!gameStarted) {
          setState(() {
            gameStarted = true;
          });
        }
        break;
      case EventType.endTurn:
        Set<Player> newPlayersList = <Player>{};
        ev.turn?.picks?.forEach((e) {
          if (e.player.id == selfID) {
            selfScore = e.player.score;
            return;
          }
          newPlayersList.add(e.player);
        });
        setState(() {
          players = newPlayersList;
          sended = false;
        });
        break;
    }
  }

  void onError(Object err) {
    if (err is WebSocketChannelException) {
      setState(() {
        errorMessage = "Сервер недоступен";
      });
    }
  }

  void onDone() {
    setState(() {
      errorMessage = "Игра окончена";
    });
  }

  Widget _buildBody() {
    if (errorMessage != null) {
      return Text(errorMessage!);
    }
    if (players.isEmpty) {
      return const CircularLoader();
    }

    List<Widget> playersRowContent = <Widget>[];

    for (int i in List.generate(4, (index) => index)) {
      playersRowContent.add(
          PlayerListItem(players.length > i ? players.elementAt(i) : null));
    }

    Row playersRow = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: playersRowContent,
    );

    Widget timerView = const TimerView(0);
    Widget picker = NumberPicker(onNumberChange);
    Widget submitLayer;

    if (!gameStarted) {
      submitLayer = const CircularLoader();
    } else {
      if (!sended) {
        submitLayer = SubmitNumberButton(submitPick);
      } else {
        submitLayer = SubmitNumberPlaceholder(pickedNumber);
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(flex: 1, child: timerView),
        Expanded(flex: 3, child: playersRow),
        Expanded(flex: 3, child: picker),
        Expanded(flex: 3, child: submitLayer),
      ],
    );
  }

  void onNumberChange(dynamic number) {
    pickedNumber = number as int;
  }

  void submitPick() {
    channel.sink.add(Pick(pickedNumber).toData());
    setState(() {
      sended = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    channel.sink.close();
    streamSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildBody(),
      ),
    );
  }
}
