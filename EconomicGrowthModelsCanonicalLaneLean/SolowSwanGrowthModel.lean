import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure SolowSwanModel where
  capitalOutputElasticity : ℝ
  savingsRate : ℝ
  depreciationRate : ℝ
  populationGrowthRate : ℝ
  technologicalProgressRate : ℝ
  productionFunction : Type u
  capitalAccumulationEquation : Prop
  steadyStateCapital : Prop
  convergenceSpeed : Prop

structure SolowSwanModelEvidence (S : SolowSwanModel) where
  capitalAccumulationEquationClosed : S.capitalAccumulationEquation
  steadyStateCapitalClosed : S.steadyStateCapital
  convergenceSpeedClosed : S.convergenceSpeed

def SolowSwanModelClosed (S : SolowSwanModel) : Prop :=
  S.capitalAccumulationEquation ∧ S.steadyStateCapital ∧ S.convergenceSpeed

theorem solow_swan_model_closed_from_evidence (S : SolowSwanModel)
    (Ev : SolowSwanModelEvidence S) : SolowSwanModelClosed S := by
  exact And.intro Ev.capitalAccumulationEquationClosed
    (And.intro Ev.steadyStateCapitalClosed Ev.convergenceSpeedClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse