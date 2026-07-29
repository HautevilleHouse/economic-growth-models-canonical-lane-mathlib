import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure MarketParameters where
  riskFreeRate : ℝ
  expectedMarketReturn : ℝ
  marketVariance : ℝ
  assetBeta : ℝ
  riskFreeRatePositive : riskFreeRate > 0
  expectedMarketReturnPositive : expectedMarketReturn > 0
  marketVariancePositive : marketVariance > 0
  assetBetaPositive : assetBeta > 0

structure CAPMPackage (M : MarketParameters) where
  expectedAssetReturn : Prop
  securityMarketLine : Prop
  efficientFrontier : Prop
  zeroBetaExpectedReturn : Prop

structure CAPMEvidence {M : MarketParameters}
    (C : CAPMPackage M) where
  expectedAssetReturnClosed : C.expectedAssetReturn
  securityMarketLineClosed : C.securityMarketLine
  efficientFrontierClosed : C.efficientFrontier
  zeroBetaExpectedReturnClosed : C.zeroBetaExpectedReturn

def CAPMClosed {M : MarketParameters} (C : CAPMPackage M) : Prop :=
  C.expectedAssetReturn ∧ C.securityMarketLine ∧ C.efficientFrontier ∧ C.zeroBetaExpectedReturn

theorem capm_closed_from_evidence
    {M : MarketParameters} (C : CAPMPackage M)
    (Ev : CAPMEvidence C) : CAPMClosed C := by
  exact And.intro Ev.expectedAssetReturnClosed
    (And.intro Ev.securityMarketLineClosed
      (And.intro Ev.efficientFrontierClosed Ev.zeroBetaExpectedReturnClosed))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse
