import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure HumanCapitalPackage where
  educationSector : Type u
  skillAccumulation : Type v
  complementarityWithPhysicalCapital : Prop
  sustainedGrowth : Prop
  complementarityWithPhysicalCapitalClosed : complementarityWithPhysicalCapital
  sustainedGrowthClosed : sustainedGrowth

structure HumanCapitalEvidence (P : HumanCapitalPackage) where
  complementarityWithPhysicalCapitalClosed : P.complementarityWithPhysicalCapital
  sustainedGrowthClosed : P.sustainedGrowth

def HumanCapitalClosed (P : HumanCapitalPackage) : Prop :=
  P.complementarityWithPhysicalCapital ∧ P.sustainedGrowth

theorem human_capital_closed_from_evidence (P : HumanCapitalPackage) (E : HumanCapitalEvidence P) :
    HumanCapitalClosed P := by
  exact And.intro E.complementarityWithPhysicalCapitalClosed E.sustainedGrowthClosed

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse