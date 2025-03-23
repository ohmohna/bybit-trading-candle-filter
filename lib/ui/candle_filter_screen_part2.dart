  Widget _buildCandleTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('캔들 타입'),
        Row(
          children: [
            Radio<bool?>(
              value: null,
              groupValue: _candleType,
              onChanged: (value) {
                setState(() {
                  _candleType = value;
                });
              },
            ),
            const Text('모두'),
            Radio<bool?>(
              value: true,
              groupValue: _candleType,
              onChanged: (value) {
                setState(() {
                  _candleType = value;
                });
              },
            ),
            const Text('양봉'),
            Radio<bool?>(
              value: false,
              groupValue: _candleType,
              onChanged: (value) {
                setState(() {
                  _candleType = value;
                });
              },
            ),
            const Text('음봉'),
          ],
        ),
      ],
    );
  }

  Widget _buildRangeSlider({
    required String title,
    required double min,
    required double max,
    required double start,
    required double end,
    required Function(RangeValues) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(
          children: [
            Text(start.toStringAsFixed(2)),
            Expanded(
              child: RangeSlider(
                min: min,
                max: max,
                values: RangeValues(start, end),
                onChanged: onChanged,
              ),
            ),
            Text(end.toStringAsFixed(2)),
          ],
        ),
      ],
    );
  }