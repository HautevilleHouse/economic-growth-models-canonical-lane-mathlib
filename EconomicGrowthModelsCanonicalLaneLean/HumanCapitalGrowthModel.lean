import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure HumanCapitalGrowthModel where
  educationInvestment : Type u
  humanCapitalAccumulation : Prop
  skillPremiumDynamics : Prop
  growthRateDetermination : Prop
  policyInterventionEffect : Prop

structure HumanCapitalGrowthModelEvidence (H : HumanCapitalGrowthModel) where
  humanCapitalAccumulationClosed : H.humanCapitalAccumulation
  skillPremiumDynamicsClosed : H.skillPremiumDynamics
  growthRateDeterminationClosed : H.growthRateDetermination
  policyInterventionEffectClosed : H.policyInterventionEffect

def HumanCapitalGrowthModelClosed (H : HumanCapitalGrowthModel) : Prop :=
  H.humanCapitalAccumulation ∧ H.skillPremiumDynamics ∧ H.growthRateDetermination ∧ H.policyInterventionEffect

theorem human_capital_growth_model_closed_from_evidence (H : HumanCapitalGrowthModel)
    (Ev : HumanCapitalGrowthModelEvidence H) : HumanCapitalGrowthModelClosed H := by
  exact And.intro Ev.humanCapitalAccumulationClosed
    (And.intro Ev.skillPremiumDynamicsClosed
      (And.intro Ev.growthRateDeterminationClosed Ev.policyInterventionEffectClosed))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse