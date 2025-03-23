import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/account.dart';
import '../models/candle_filter.dart';
import '../utils/candle_filter_utils.dart';

class CandleFilterScreen extends StatefulWidget {
  final List<Candle> candles;
  final bool autoTrading;

  const CandleFilterScreen({
    Key? key,
    required this.candles,
    this.autoTrading = false,
  }) : super(key: key);

  @override
  _CandleFilterScreenState createState() => _CandleFilterScreenState();
}

class _CandleFilterScreenState extends State<CandleFilterScreen> {
  late CandleFilter _filter;
  List<Candle> _filteredCandles = [];
  bool? _candleType;

  @override
  void initState() {
    super.initState();
    _filter = CandleFilter();
    _applyFilter();
  }

  void _applyFilter() {
    setState(() {
      _filter = CandleFilter(
        isGreenCandle: _candleType,
        minBodySizeRatio: _filter.minBodySizeRatio,
        maxBodySizeRatio: _filter.maxBodySizeRatio,
        minUpperTailRatio: _filter.minUpperTailRatio,
        maxUpperTailRatio: _filter.maxUpperTailRatio,
        minLowerTailRatio: _filter.minLowerTailRatio,
        maxLowerTailRatio: _filter.maxLowerTailRatio,
        minVolume: _filter.minVolume,
        maxVolume: _filter.maxVolume,
        minBuyingStrength: _filter.minBuyingStrength,
        maxBuyingStrength: _filter.maxBuyingStrength,
      );
      _filteredCandles = CandleFilterUtils.filterCandles(widget.candles, _filter);
    });
  }