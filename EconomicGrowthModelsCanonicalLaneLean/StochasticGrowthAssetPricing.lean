import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure StochasticGrowthModel where
  stateSpace : Type u
  consumptionProcess : Type v
  assetPrices : Type w
  stochasticDiscountFactor : Type x
  eulerEquation : Prop
  noArbitrage : Prop
  equilibriumPriceExistence : Prop

structure StochasticGrowthModelEvidence (S : StochasticGrowthModel) where
  eulerEquationClosed : S.eulerEquation
  noArbitrageClosed : S.noArbitrage
  equilibriumPriceExistenceClosed : S.equilibriumPriceExistence

def StochasticGrowthModelClosed (S : StochasticGrowthModel) : Prop :=
  S.eulerEquation ∧ S.noArbitrage ∧ S.equilibriumPriceExistence

theorem stochastic_growth_model_closed_from_evidence (S : StochasticGrowthModel)
    (Ev : StochasticGrowthModelEvidence S) : StochasticGrowthModelClosed S := by
  exact And.intro Ev.eulerEquationClosed
    (And.intro Ev.noArbitrageClosed Ev.equilibriumPriceExistenceClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse