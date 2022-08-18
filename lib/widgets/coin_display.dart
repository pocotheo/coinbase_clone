import 'package:flutter/material.dart';

import '../model/coin.dart';
import '../services/coin_repository.dart';
import 'coin_card.dart';

class CoinDisplay extends StatefulWidget {
  const CoinDisplay({Key? key}) : super(key: key);

  @override
  State<CoinDisplay> createState() => _CoinDisplayState();
}

class _CoinDisplayState extends State<CoinDisplay> {
  late Future<List<Coin>> _getCoins;

  @override
  void initState() {
    _getCoins = CoinRepository.getCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Coin>>(
        future: _getCoins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            final coins = snapshot.data ?? [];
            return Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 40),
              child: Column(
                children: coins
                    .map((coin) => GestureDetector(
                        onTap: () {}, child: CoinCard(coin: coin)))
                    .toList(),
              ),
            );
          }
          return const Center(child: Text("Loading"));
        });
  }
}
