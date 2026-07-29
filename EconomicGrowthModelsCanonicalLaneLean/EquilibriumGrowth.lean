import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure EquilibriumGrowthPackage where
  productionTechnology : Prop
  capitalAccumulation : Prop
  consumptionChoice : Prop
  equilibriumGrowthPath : Prop
  balancedGrowthSteadyState : Prop

structure EquilibriumGrowthEvidence (P : EquilibriumGrowthPackage) where
  productionTechnologyClosed : P.productionTechnology
  capitalAccumulationClosed : P.capitalAccumulation
  consumptionChoiceClosed : P.consumptionChoice
  equilibriumGrowthPathClosed : P.equilibriumGrowthPath
  balancedGrowthSteadyStateClosed : P.balancedGrowthSteadyState

def EquilibriumGrowthClosed (P : EquilibriumGrowthPackage) : Prop :=
  P.productionTechnology ∧ P.capitalAccumulation ∧
  P.consumptionChoice ∧ P.equilibriumGrowthPath ∧
  P.balancedGrowthSteadyState

theorem equilibrium_growth_closed_from_evidence
    (P : EquilibriumGrowthPackage) (E : EquilibriumGrowthEvidence P) :
    EquilibriumGrowthClosed P := by
  exact And.intro E.productionTechnologyClosed
    (And.intro E.capitalAccumulationClosed
      (And.intro E.consumptionChoiceClosed
        (And.intro E.equilibriumGrowthPathClosed
          E.balancedGrowthSteadyStateClosed)))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse