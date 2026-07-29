import EconomicGrowthModelsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure RamseyCassKoopmansModelPackage where
  representativeHousehold : Type u
  capitalStock : Type v
  consumption : Type w
  productionFunction : Type x
  eulerEquation : Prop
  transversalityCondition : Prop
  balancedGrowthPath : Prop
  saddlePathStability : Prop

structure RamseyCassKoopmansModelEvidence (R : RamseyCassKoopmansModelPackage) where
  eulerEquationClosed : R.eulerEquation
  transversalityConditionClosed : R.transversalityCondition
  balancedGrowthPathClosed : R.balancedGrowthPath
  saddlePathStabilityClosed : R.saddlePathStability

def RamseyCassKoopmansModelClosed (R : RamseyCassKoopmansModelPackage) : Prop :=
  R.eulerEquation ∧ R.transversalityCondition ∧
  R.balancedGrowthPath ∧ R.saddlePathStability

theorem ramsey_cass_koopmans_model_closed_from_evidence
    (R : RamseyCassKoopmansModelPackage)
    (E : RamseyCassKoopmansModelEvidence R) :
    RamseyCassKoopmansModelClosed R := by
  exact And.intro E.eulerEquationClosed
    (And.intro E.transversalityConditionClosed
      (And.intro E.balancedGrowthPathClosed E.saddlePathStabilityClosed))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse