  Widget _buildFilteredCandlesList() {
    if (_filteredCandles.isEmpty) {
      return const Center(
        child: Text('조건에 맞는 캔들이 없습니다'),
      );
    }
    
    return ListView.builder(
      itemCount: _filteredCandles.length,
      itemBuilder: (context, index) {
        final candle = _filteredCandles[index];
        final date = DateTime.fromMillisecondsSinceEpoch(candle.timestamp);
        final isGreen = candle.isGreenCandle();
        
        return ListTile(
          title: Text(
            '${date.toLocal()} - ${isGreen ? "양봉" : "음봉"}',
            style: TextStyle(
              color: isGreen ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '시: ${candle.open} 고: ${candle.high} 저: ${candle.low} 종: ${candle.close}\n'
            '몸통: ${candle.bodySizeRatio().toStringAsFixed(2)} '
            '윗꼬리: ${candle.upperTailRatio().toStringAsFixed(2)} '
            '아랫꼬리: ${candle.lowerTailRatio().toStringAsFixed(2)}\n'
            '거래량: ${candle.volume.toStringAsFixed(2)} '
            '체결강도: ${candle.buyingStrength.toStringAsFixed(2)}',
          ),
          isThreeLine: true,
        );
      },
    );
  }

  Widget _buildFilterPanel() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCandleTypeSelector(),
          _buildRangeSlider(
            title: '몸통 크기 비율',
            min: 0.0,
            max: 1.0,
            start: _filter.minBodySizeRatio,
            end: _filter.maxBodySizeRatio,
            onChanged: (values) {
              setState(() {
                _filter.minBodySizeRatio = values.start;
                _filter.maxBodySizeRatio = values.end;
              });
            },
          ),
          _buildRangeSlider(
            title: '윗꼬리 길이 비율',
            min: 0.0,
            max: 5.0,
            start: _filter.minUpperTailRatio,
            end: _filter.maxUpperTailRatio,
            onChanged: (values) {
              setState(() {
                _filter.minUpperTailRatio = values.start;
                _filter.maxUpperTailRatio = values.end;
              });
            },
          ),
        ],
      ),
    );
  }