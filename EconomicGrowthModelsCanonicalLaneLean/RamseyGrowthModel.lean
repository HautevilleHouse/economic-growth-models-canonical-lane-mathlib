import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure RamseyGrowthEconomy where
  householdUtility : Type u
  productionFunction : Type v
  capitalAccumulation : Prop
  eulerEquation : Prop
  transversalityCondition : Prop
  steadyStateExistence : Prop

structure RamseyGrowthModelEvidence (R : RamseyGrowthEconomy) where
  capitalAccumulationClosed : R.capitalAccumulation
  eulerEquationClosed : R.eulerEquation
  transversalityConditionClosed : R.transversalityCondition
  steadyStateExistenceClosed : R.steadyStateExistence

def RamseyGrowthModelClosed (R : RamseyGrowthEconomy) : Prop :=
  R.capitalAccumulation ∧ R.eulerEquation ∧ R.transversalityCondition ∧ R.steadyStateExistence

theorem ramsey_growth_model_closed_from_evidence (R : RamseyGrowthEconomy)
    (Ev : RamseyGrowthModelEvidence R) : RamseyGrowthModelClosed R := by
  exact And.intro Ev.capitalAccumulationClosed
    (And.intro Ev.eulerEquationClosed
      (And.intro Ev.transversalityConditionClosed Ev.steadyStateExistenceClosed))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse