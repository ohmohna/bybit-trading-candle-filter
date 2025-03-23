import '../models/account.dart';

/// 캔들 패턴 필터 조건 클래스
class CandleFilter {
  // 캔들 타입 (양봉/음봉)
  bool? isGreenCandle;
  
  // 캔들 몸통 크기 범위 (종가-시가의 절대값/고가)
  double minBodySizeRatio;
  double maxBodySizeRatio;
  
  // 윗꼬리 길이 비율 범위 (고가-최대(시가,종가))/몸통
  double minUpperTailRatio;
  double maxUpperTailRatio;
  
  // 아랫꼬리 길이 비율 범위 (최소(시가,종가)-저가)/몸통
  double minLowerTailRatio;
  double maxLowerTailRatio;
  
  // 거래량 범위
  double minVolume;
  double maxVolume;
  
  // 체결강도 범위 (매수세/매도세)
  double minBuyingStrength;
  double maxBuyingStrength;

  CandleFilter({
    this.isGreenCandle,
    this.minBodySizeRatio = 0.0,
    this.maxBodySizeRatio = 1.0,
    this.minUpperTailRatio = 0.0,
    this.maxUpperTailRatio = 5.0,
    this.minLowerTailRatio = 0.0,
    this.maxLowerTailRatio = 5.0,
    this.minVolume = 0.0,
    this.maxVolume = double.infinity,
    this.minBuyingStrength = 0.0,
    this.maxBuyingStrength = 1.0,
  });
}