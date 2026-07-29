import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.CurvatureInvariants
import DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.ConnectionTheory

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure IndexTheoremPackage (M : HomogeneousManifold) (C : ConnectionPackage M) (I : CurvatureInvariant) where
  analyticIndex : Prop
  topologicalIndex : Prop
  indexEquality : Prop

structure IndexTheoremEvidence {M : HomogeneousManifold} {C : ConnectionPackage M} {I : CurvatureInvariant}
    (P : IndexTheoremPackage M C I) where
  analyticIndexClosed : P.analyticIndex
  topologicalIndexClosed : P.topologicalIndex
  indexEqualityClosed : P.indexEquality

def IndexTheoremClosed {M : HomogeneousManifold} {C : ConnectionPackage M} {I : CurvatureInvariant}
    (P : IndexTheoremPackage M C I) : Prop :=
  P.analyticIndex ∧ P.topologicalIndex ∧ P.indexEquality

theorem index_theorem_closed_from_evidence
    {M : HomogeneousManifold} {C : ConnectionPackage M} {I : CurvatureInvariant}
    (P : IndexTheoremPackage M C I) (E : IndexTheoremEvidence P) : IndexTheoremClosed P := by
  exact And.intro E.analyticIndexClosed (And.intro E.topologicalIndexClosed E.indexEqualityClosed)

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse