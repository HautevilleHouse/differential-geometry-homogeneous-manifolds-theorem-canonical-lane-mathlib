import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : HomogeneousManifoldAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  HomogeneousManifoldWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
