import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure BusinessCyclesModel where
  aggregateDemand : Type u
  aggregateSupply : Type v
  priceAdjustment : Prop
  outputFluctuations : Prop
  stabilizationPolicy : Prop

structure BusinessCyclesEvidence (B : BusinessCyclesModel) where
  priceAdjustmentClosed : B.priceAdjustment
  outputFluctuationsClosed : B.outputFluctuations
  stabilizationPolicyClosed : B.stabilizationPolicy

def BusinessCyclesClosed (B : BusinessCyclesModel) : Prop :=
  B.priceAdjustment ∧ B.outputFluctuations ∧ B.stabilizationPolicy

theorem business_cycles_closed_from_evidence (B : BusinessCyclesModel)
    (Ev : BusinessCyclesEvidence B) : BusinessCyclesClosed B := by
  exact And.intro Ev.priceAdjustmentClosed
    (And.intro Ev.outputFluctuationsClosed Ev.stabilizationPolicyClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse