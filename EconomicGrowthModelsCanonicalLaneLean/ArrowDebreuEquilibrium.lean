import EconomicGrowthModelsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure ArrowDebreuEquilibriumPackage where
  priceSystem : Type u
  commoditySpace : Type v
  endowments : Type w
  utilityFunctions : Type x
  productionSets : Type y
  budgetConstraints : Prop
  marketClearing : Prop
  individualOptimality : Prop

structure ArrowDebreuEquilibriumEvidence (A : ArrowDebreuEquilibriumPackage) where
  budgetConstraintsClosed : A.budgetConstraints
  marketClearingClosed : A.marketClearing
  individualOptimalityClosed : A.individualOptimality

def ArrowDebreuEquilibriumClosed (A : ArrowDebreuEquilibriumPackage) : Prop :=
  A.budgetConstraints ∧ A.marketClearing ∧ A.individualOptimality

theorem arrow_debreu_equilibrium_closed_from_evidence
    (A : ArrowDebreuEquilibriumPackage)
    (E : ArrowDebreuEquilibriumEvidence A) :
    ArrowDebreuEquilibriumClosed A := by
  exact And.intro E.budgetConstraintsClosed
    (And.intro E.marketClearingClosed E.individualOptimalityClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse