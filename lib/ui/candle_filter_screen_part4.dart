  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('캔들 패턴 필터'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _applyFilter,
            tooltip: '필터 적용',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterPanel(),
          const Divider(),
          Expanded(
            child: _buildFilteredCandlesList(),
          ),
        ],
      ),
    );
  }