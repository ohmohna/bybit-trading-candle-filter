import '../models/account.dart';
import '../models/candle_filter.dart';

/// Candle 클래스에 대한 확장 유틸리티 함수
extension CandleExtension on Candle {
  // 양봉인지 여부 (종가 > 시가)
  bool isGreenCandle() {
    return close > open;
  }
  
  // 캔들 몸통 크기 계산 (종가-시가의 절대값)
  double bodySize() {
    return (close - open).abs();
  }
  
  // 캔들 몸통 크기 비율 (몸통크기/캔들전체크기)
  double bodySizeRatio() {
    final range = high - low;
    if (range == 0) return 0.0;
    return bodySize() / range;
  }
  
  // 윗꼬리 길이 계산
  double upperTail() {
    return high - (close > open ? close : open);
  }
  
  // 윗꼬리 길이 비율
  double upperTailRatio() {
    final body = bodySize();
    if (body == 0) return 0.0;
    return upperTail() / body;
  }
  
  // 아랫꼬리 길이 계산
  double lowerTail() {
    return (close < open ? close : open) - low;
  }
  
  // 아랫꼬리 길이 비율
  double lowerTailRatio() {
    final body = bodySize();
    if (body == 0) return 0.0;
    return lowerTail() / body;
  }
}

/// 캔들 필터링 유틸리티 함수
class CandleFilterUtils {
  /// 주어진 필터 조건에 맞는 캔들 목록 반환
  static List<Candle> filterCandles(
      List<Candle> candles, CandleFilter filter) {
    return candles.where((candle) {
      // 양봉/음봉 여부 확인
      if (filter.isGreenCandle != null && 
          candle.isGreenCandle() != filter.isGreenCandle) {
        return false;
      }
      
      // 몸통 크기 비율 확인
      final bodySizeRatio = candle.bodySizeRatio();
      if (bodySizeRatio < filter.minBodySizeRatio || 
          bodySizeRatio > filter.maxBodySizeRatio) {
        return false;
      }
      
      // 윗꼬리 길이 비율 확인
      final upperTailRatio = candle.upperTailRatio();
      if (upperTailRatio < filter.minUpperTailRatio || 
          upperTailRatio > filter.maxUpperTailRatio) {
        return false;
      }
      
      // 아랫꼬리 길이 비율 확인
      final lowerTailRatio = candle.lowerTailRatio();
      if (lowerTailRatio < filter.minLowerTailRatio || 
          lowerTailRatio > filter.maxLowerTailRatio) {
        return false;
      }
      
      // 거래량 확인
      if (candle.volume < filter.minVolume || 
          candle.volume > filter.maxVolume) {
        return false;
      }
      
      // 체결강도 확인
      final buyingStrength = candle.buyingStrength;
      if (buyingStrength < filter.minBuyingStrength || 
          buyingStrength > filter.maxBuyingStrength) {
        return false;
      }
      
      return true;
    }).toList();
  }
}