import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure SolowSwanPackage where
  productionFunction : Type u
  capitalAccumulation : Type v
  constantReturnsToScale : Prop
  diminishingMarginalProduct : Prop
  steadyStateExistence : Prop
  steadyStateStability : Prop
  constantReturnsToScaleClosed : constantReturnsToScale
  diminishingMarginalProductClosed : diminishingMarginalProduct
  steadyStateExistenceClosed : steadyStateExistence
  steadyStateStabilityClosed : steadyStateStability

structure SolowSwanEvidence (P : SolowSwanPackage) where
  constantReturnsToScaleClosed : P.constantReturnsToScale
  diminishingMarginalProductClosed : P.diminishingMarginalProduct
  steadyStateExistenceClosed : P.steadyStateExistence
  steadyStateStabilityClosed : P.steadyStateStability

def SolowSwanClosed (P : SolowSwanPackage) : Prop :=
  P.constantReturnsToScale ∧ P.diminishingMarginalProduct ∧
  P.steadyStateExistence ∧ P.steadyStateStability

theorem solow_swan_closed_from_evidence (P : SolowSwanPackage) (E : SolowSwanEvidence P) :
    SolowSwanClosed P := by
  exact And.intro E.constantReturnsToScaleClosed
    (And.intro E.diminishingMarginalProductClosed
      (And.intro E.steadyStateExistenceClosed E.steadyStateStabilityClosed))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse