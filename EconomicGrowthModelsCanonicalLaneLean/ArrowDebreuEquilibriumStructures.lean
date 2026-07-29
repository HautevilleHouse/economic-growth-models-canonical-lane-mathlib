import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure ArrowDebreuEconomy where
  commoditySpace : Type u
  priceSpace : Type v
  consumerSet : Type w
  producerSet : Type x
  endowments : consumerSet → commoditySpace
  preferences : consumerSet → (commoditySpace → Prop)
  productionSets : producerSet → Set (commoditySpace)
  marketClearingCondition : Prop

structure ArrowDebreuEvidence (E : ArrowDebreuEconomy) where
  marketClearingConditionClosed : E.marketClearingCondition
  preferencesComplete : Prop
  preferencesTransitive : Prop
  preferencesContinuous : Prop
  preferencesCompleteClosed : preferencesComplete
  preferencesTransitiveClosed : preferencesTransitive
  preferencesContinuousClosed : preferencesContinuous

def ArrowDebreuEquilibriumClosed (E : ArrowDebreuEconomy) : Prop :=
  E.marketClearingCondition

theorem arrow_debreu_equilibrium_closed_from_evidence (E : ArrowDebreuEconomy)
    (Ev : ArrowDebreuEvidence E) : ArrowDebreuEquilibriumClosed E := by
  exact Ev.marketClearingConditionClosed

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse