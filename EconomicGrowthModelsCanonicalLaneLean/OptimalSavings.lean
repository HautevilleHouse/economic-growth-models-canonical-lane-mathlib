import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure OptimalSavingsModel where
  discountFactor : Type u
  utilityFunction : Type v
  budgetConstraint : Prop
  eulerEquation : Prop
  transversalityCondition : Prop

structure OptimalSavingsEvidence (S : OptimalSavingsModel) where
  budgetConstraintClosed : S.budgetConstraint
  eulerEquationClosed : S.eulerEquation
  transversalityConditionClosed : S.transversalityCondition

def OptimalSavingsClosed (S : OptimalSavingsModel) : Prop :=
  S.budgetConstraint ∧ S.eulerEquation ∧ S.transversalityCondition

theorem optimal_savings_closed_from_evidence (S : OptimalSavingsModel)
    (Ev : OptimalSavingsEvidence S) : OptimalSavingsClosed S := by
  exact And.intro Ev.budgetConstraintClosed
    (And.intro Ev.eulerEquationClosed Ev.transversalityConditionClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse