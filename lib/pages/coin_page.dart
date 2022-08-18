import 'package:flutter/material.dart';

import '../model/coin.dart';
import '../model/coin_data.dart';
import '../services/coin_repository.dart';
import '../util/theme.dart';

class CoinPage extends StatefulWidget {
  final Coin coin;
  const CoinPage({required this.coin, Key? key}) : super(key: key);

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  late Future<List<CoinData>> _getCoinHourly;
  late double _coinPrice;

  @override
  void initState() {
    super.initState();
    _getCoinHourly = CoinRepository.getCoinHourlyData(widget.coin.ticker);
    _coinPrice = widget.coin.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Text(
                "${widget.coin.fullName} price",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
              ),
              Text(
                "\$${_coinPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                widget.coin.fullName,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.coin.ticker,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey.shade300,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Algorithm: ${widget.coin.algorithm}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Text(
                "Block number: ${widget.coin.blockNumber.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Text(
                "Block reward: ${widget.coin.blockReward.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Text(
                "Block time: ${widget.coin.blockTime.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Text(
                "Max supply: ${widget.coin.maxSupply}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15)),
                    backgroundColor:
                        MaterialStateProperty.all(CoinbaseTheme.color)),
                child: const Text(
                  "Trade",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.coin.fullName,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
