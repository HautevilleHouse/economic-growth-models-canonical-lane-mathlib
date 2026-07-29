import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure RamseyPackage where
  householdOptimization : Type u
  firmOptimization : Type v
  intertemporalEulerEquation : Prop
  capitalAccumulation : Prop
  transversalityCondition : Prop
  steadyStateSaddlePath : Prop
  intertemporalEulerEquationClosed : intertemporalEulerEquation
  capitalAccumulationClosed : capitalAccumulation
  transversalityConditionClosed : transversalityCondition
  steadyStateSaddlePathClosed : steadyStateSaddlePath

structure RamseyEvidence (P : RamseyPackage) where
  intertemporalEulerEquationClosed : P.intertemporalEulerEquation
  capitalAccumulationClosed : P.capitalAccumulation
  transversalityConditionClosed : P.transversalityCondition
  steadyStateSaddlePathClosed : P.steadyStateSaddlePath

def RamseyClosed (P : RamseyPackage) : Prop :=
  P.intertemporalEulerEquation ∧ P.capitalAccumulation ∧
  P.transversalityCondition ∧ P.steadyStateSaddlePath

theorem ramsey_closed_from_evidence (P : RamseyPackage) (E : RamseyEvidence P) :
    RamseyClosed P := by
  exact And.intro E.intertemporalEulerEquationClosed
    (And.intro E.capitalAccumulationClosed
      (And.intro E.transversalityConditionClosed E.steadyStateSaddlePathClosed))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse