import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicGrowthModelsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GrowthWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EconomicGrowthModelsCanonicalLaneLean
end HautevilleHouse