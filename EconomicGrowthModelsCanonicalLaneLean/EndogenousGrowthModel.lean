import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure AKModelPackage where
  linearTechnology : Type u
  constantReturnsToCapital : Prop
  noTransitionalDynamics : Prop
  sustainedGrowthRate : Prop
  constantReturnsToCapitalClosed : constantReturnsToCapital
  noTransitionalDynamicsClosed : noTransitionalDynamics
  sustainedGrowthRateClosed : sustainedGrowthRate

structure AKModelEvidence (P : AKModelPackage) where
  constantReturnsToCapitalClosed : P.constantReturnsToCapital
  noTransitionalDynamicsClosed : P.noTransitionalDynamics
  sustainedGrowthRateClosed : P.sustainedGrowthRate

def AKModelClosed (P : AKModelPackage) : Prop :=
  P.constantReturnsToCapital ∧ P.noTransitionalDynamics ∧ P.sustainedGrowthRate

theorem ak_model_closed_from_evidence (P : AKModelPackage) (E : AKModelEvidence P) :
    AKModelClosed P := by
  exact And.intro E.constantReturnsToCapitalClosed
    (And.intro E.noTransitionalDynamicsClosed E.sustainedGrowthRateClosed)

structure RomerModelPackage where
  researchSector : Type u
  intermediateGoods : Type v
  knowledgeSpillover : Prop
  monopolisticCompetition : Prop
  increasingReturnsToScale : Prop
  knowledgeSpilloverClosed : knowledgeSpillover
  monopolisticCompetitionClosed : monopolisticCompetition
  increasingReturnsToScaleClosed : increasingReturnsToScale

structure RomerModelEvidence (P : RomerModelPackage) where
  knowledgeSpilloverClosed : P.knowledgeSpillover
  monopolisticCompetitionClosed : P.monopolisticCompetition
  increasingReturnsToScaleClosed : P.increasingReturnsToScale

def RomerModelClosed (P : RomerModelPackage) : Prop :=
  P.knowledgeSpillover ∧ P.monopolisticCompetition ∧ P.increasingReturnsToScale

theorem romer_model_closed_from_evidence (P : RomerModelPackage) (E : RomerModelEvidence P) :
    RomerModelClosed P := by
  exact And.intro E.knowledgeSpilloverClosed
    (And.intro E.monopolisticCompetitionClosed E.increasingReturnsToScaleClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse