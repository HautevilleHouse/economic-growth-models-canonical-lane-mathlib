import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

structure GrowthAdmittedObject where
  economy : Type u
  equilibriumAllocation : Prop
  paretoOptimal : Prop
  representativeAgentUtility : Prop
  conclusion : equilibriumAllocation ∧ paretoOptimal

def GrowthWitnessClosed (O : GrowthAdmittedObject) : Prop :=
  O.conclusion

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse