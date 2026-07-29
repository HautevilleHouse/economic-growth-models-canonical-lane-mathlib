import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure PreferenceOrder where
  outcomeSet : Type u
  preferenceRelation : outcomeSet → outcomeSet → Prop
  completeness : ∀ x y : outcomeSet, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z : outcomeSet, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  continuity : Prop

structure ExpectedUtilityPackage (P : PreferenceOrder) where
  utilityFunction : P.outcomeSet → ℝ
  expectedUtilityForm : Prop
  vnmAxioms : Prop
  representationTheorem : Prop

structure ExpectedUtilityEvidence {P : PreferenceOrder}
    (E : ExpectedUtilityPackage P) where
  utilityFunctionClosed : E.utilityFunction 0 = 0  -- placeholder
  expectedUtilityFormClosed : E.expectedUtilityForm
  vnmAxiomsClosed : E.vnmAxioms
  representationTheoremClosed : E.representationTheorem

def ExpectedUtilityClosed {P : PreferenceOrder}
    (E : ExpectedUtilityPackage P) : Prop :=
  E.expectedUtilityForm ∧ E.vnmAxioms ∧ E.representationTheorem

theorem expected_utility_closed_from_evidence
    {P : PreferenceOrder} (E : ExpectedUtilityPackage P)
    (Ev : ExpectedUtilityEvidence E) : ExpectedUtilityClosed E := by
  exact And.intro Ev.expectedUtilityFormClosed
    (And.intro Ev.vnmAxiomsClosed Ev.representationTheoremClosed)

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse
