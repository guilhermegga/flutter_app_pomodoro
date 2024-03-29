// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_mobxx/components/Entrada_Tempo.dart';
import 'package:pomodoro_mobxx/components/cronometro.dart';
import 'package:pomodoro_mobxx/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Cronometro(),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EntradaTempo(
                      titulo: 'Trabalho',
                      valor: store.tempoTrabalho,
                      inc: store.iniciado && store.isTrabalhando()
                          ? null
                          : store.incrementarTempoTrabalho,
                      dec: store.iniciado && store.isTrabalhando()
                          ? null
                          : store.decrementarTempoTrabalho,
                    ),
                    EntradaTempo(
                      titulo: 'Descanso',
                      valor: store.tempoDescanso,
                      inc: store.iniciado && store.isDescansando()
                          ? null
                          : store.incrementarTempoDescanso,
                      dec: store.iniciado && store.isDescansando()
                          ? null
                          : store.decrementarTempoDescanso,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
