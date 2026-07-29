import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure OLGPackage where
  twoPeriodLives : Type u
  productionSector : Type v
  intergenerationalTrade : Prop
  dynamicInefficiency : Prop
  steadyStateExistence : Prop
  intergenerationalTradeClosed : intergenerationalTrade
  dynamicInefficiencyClosed : dynamicInefficiency
  steadyStateExistenceClosed : steadyStateExistence

structure OLGEvidence (P : OLGPackage) where
  intergenerationalTradeClosed : P.intergenerationalTrade
  dynamicInefficiencyClosed : P.dynamicInefficiency
  steadyStateExistenceClosed : P.steadyStateExistence

def OLGClosed (P : OLGPackage) : Prop :=
  P.intergenerationalTrade ∧ P.dynamicInefficiency ∧ P.steadyStateExistence

theorem olg_closed_from_evidence (P : OLGPackage) (E : OLGEvidence P) :
    OLGClosed P := by
  exact And.intro E.intergenerationalTradeClosed
    (And.intro E.dynamicInefficiencyClosed E.steadyStateExistenceClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse