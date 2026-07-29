import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure WelfareTheoremsPackage where
  competitiveEquilibrium : Prop
  paretoOptimalAllocation : Prop
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop
  lumpSumTransfers : Prop

structure WelfareTheoremsEvidence (W : WelfareTheoremsPackage) where
  competitiveEquilibriumClosed : W.competitiveEquilibrium
  paretoOptimalAllocationClosed : W.paretoOptimalAllocation
  firstWelfareTheoremClosed : W.firstWelfareTheorem
  secondWelfareTheoremClosed : W.secondWelfareTheorem
  lumpSumTransfersClosed : W.lumpSumTransfers

def WelfareTheoremsClosed (W : WelfareTheoremsPackage) : Prop :=
  W.competitiveEquilibrium ∧ W.paretoOptimalAllocation ∧
  W.firstWelfareTheorem ∧ W.secondWelfareTheorem ∧
  W.lumpSumTransfers

theorem welfare_theorems_closed_from_evidence
    (W : WelfareTheoremsPackage) (E : WelfareTheoremsEvidence W) :
    WelfareTheoremsClosed W := by
  exact And.intro E.competitiveEquilibriumClosed
    (And.intro E.paretoOptimalAllocationClosed
      (And.intro E.firstWelfareTheoremClosed
        (And.intro E.secondWelfareTheoremClosed
          E.lumpSumTransfersClosed)))

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse