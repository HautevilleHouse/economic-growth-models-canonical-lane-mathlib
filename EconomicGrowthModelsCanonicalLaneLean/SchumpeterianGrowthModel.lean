import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure SchumpeterianPackage where
  qualityLadders : Type u
  creativeDestruction : Type v
  innovationRaces : Prop
  patentMonopoly : Prop
  growthThroughInnovation : Prop
  innovationRacesClosed : innovationRaces
  patentMonopolyClosed : patentMonopoly
  growthThroughInnovationClosed : growthThroughInnovation

structure SchumpeterianEvidence (P : SchumpeterianPackage) where
  innovationRacesClosed : P.innovationRaces
  patentMonopolyClosed : P.patentMonopoly
  growthThroughInnovationClosed : P.growthThroughInnovation

def SchumpeterianClosed (P : SchumpeterianPackage) : Prop :=
  P.innovationRaces ∧ P.patentMonopoly ∧ P.growthThroughInnovation

theorem schumpeterian_closed_from_evidence (P : SchumpeterianPackage) (E : SchumpeterianEvidence P) :
    SchumpeterianClosed P := by
  exact And.intro E.innovationRacesClosed
    (And.intro E.patentMonopolyClosed E.growthThroughInnovationClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse