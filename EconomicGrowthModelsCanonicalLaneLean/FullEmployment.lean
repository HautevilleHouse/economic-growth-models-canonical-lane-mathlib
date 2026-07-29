import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure FullEmploymentModel where
  laborSupply : Type u
  laborDemand : Type v
  wageDetermination : Prop
  laborMarketClearing : Prop
  efficiencyWageCondition : Prop

structure FullEmploymentEvidence (F : FullEmploymentModel) where
  wageDeterminationClosed : F.wageDetermination
  laborMarketClearingClosed : F.laborMarketClearing
  efficiencyWageConditionClosed : F.efficiencyWageCondition

def FullEmploymentClosed (F : FullEmploymentModel) : Prop :=
  F.wageDetermination ∧ F.laborMarketClearing ∧ F.efficiencyWageCondition

theorem full_employment_closed_from_evidence (F : FullEmploymentModel)
    (Ev : FullEmploymentEvidence F) : FullEmploymentClosed F := by
  exact And.intro Ev.wageDeterminationClosed
    (And.intro Ev.laborMarketClearingClosed Ev.efficiencyWageConditionClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse