import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure TechnologicalProgressModel where
  researchSector : Type u
  innovationFunction : Type v
  knowledgeAccumulation : Prop
  productivityGrowth : Prop
  endogenousProgress : Prop

structure TechnologicalProgressEvidence (T : TechnologicalProgressModel) where
  knowledgeAccumulationClosed : T.knowledgeAccumulation
  productivityGrowthClosed : T.productivityGrowth
  endogenousProgressClosed : T.endogenousProgress

def TechnologicalProgressClosed (T : TechnologicalProgressModel) : Prop :=
  T.knowledgeAccumulation ∧ T.productivityGrowth ∧ T.endogenousProgress

theorem technological_progress_closed_from_evidence (T : TechnologicalProgressModel)
    (Ev : TechnologicalProgressEvidence T) : TechnologicalProgressClosed T := by
  exact And.intro Ev.knowledgeAccumulationClosed
    (And.intro Ev.productivityGrowthClosed Ev.endogenousProgressClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse