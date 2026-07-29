import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure RamseyCassKoopmansParameters where
  discountRate : ℝ
  intertemporalElasticity : ℝ
  capitalShare : ℝ
  depreciationRate : ℝ
  populationGrowthRate : ℝ
  productivityGrowthRate : ℝ
  discountPositive : discountRate > 0
  intertemporalElasticityPositive : intertemporalElasticity > 0
  capitalShareInUnitInterval : 0 < capitalShare ∧ capitalShare < 1
  depreciationNonnegative : depreciationRate ≥ 0
  populationGrowthNonnegative : populationGrowthRate ≥ 0
  productivityGrowthNonnegative : productivityGrowthRate ≥ 0

structure RamseyCassKoopmansPackage (P : RamseyCassKoopmansParameters) where
  eulerEquation : Prop
  transversalityCondition : Prop
  balancedGrowthPath : Prop
  saddlePathStability : Prop

structure RamseyCassKoopmansEvidence {P : RamseyCassKoopmansParameters}
    (R : RamseyCassKoopmansPackage P) where
  eulerEquationClosed : R.eulerEquation
  transversalityConditionClosed : R.transversalityCondition
  balancedGrowthPathClosed : R.balancedGrowthPath
  saddlePathStabilityClosed : R.saddlePathStability

def RamseyCassKoopmansClosed {P : RamseyCassKoopmansParameters}
    (R : RamseyCassKoopmansPackage P) : Prop :=
  R.eulerEquation ∧ R.transversalityCondition ∧ R.balancedGrowthPath ∧ R.saddlePathStability

theorem ramsey_cass_koopmans_closed_from_evidence
    {P : RamseyCassKoopmansParameters} (R : RamseyCassKoopmansPackage P)
    (Ev : RamseyCassKoopmansEvidence R) : RamseyCassKoopmansClosed R := by
  exact And.intro Ev.eulerEquationClosed
    (And.intro Ev.transversalityConditionClosed
      (And.intro Ev.balancedGrowthPathClosed Ev.saddlePathStabilityClosed))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse
