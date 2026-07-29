import DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HomogeneousManifoldWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse
