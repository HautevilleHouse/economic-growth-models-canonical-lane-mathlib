import EconomicGrowthModelsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure AssetPricingModelPackage where
  stochasticDiscountFactor : Type u
  assetPayoffs : Type v
  equilibriumPrices : Type w
  noArbitrage : Prop
  riskNeutralValuation : Prop
  consumptionCAPM : Prop
  volatilityBounds : Prop

structure AssetPricingModelEvidence (A : AssetPricingModelPackage) where
  noArbitrageClosed : A.noArbitrage
  riskNeutralValuationClosed : A.riskNeutralValuation
  consumptionCAPMClosed : A.consumptionCAPM
  volatilityBoundsClosed : A.volatilityBounds

def AssetPricingModelClosed (A : AssetPricingModelPackage) : Prop :=
  A.noArbitrage ∧ A.riskNeutralValuation ∧
  A.consumptionCAPM ∧ A.volatilityBounds

theorem asset_pricing_model_closed_from_evidence
    (A : AssetPricingModelPackage)
    (E : AssetPricingModelEvidence A) :
    AssetPricingModelClosed A := by
  exact And.intro E.noArbitrageClosed
    (And.intro E.riskNeutralValuationClosed
      (And.intro E.consumptionCAPMClosed E.volatilityBoundsClosed))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse