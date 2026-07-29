import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.HomogeneousManifold

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure ConnectionPackage (M : HomogeneousManifold) where
  connectionType : Type
  torsionFree : Prop
  metricCompatible : Prop
  curvature : Prop

structure ConnectionEvidence {M : HomogeneousManifold} (C : ConnectionPackage M) where
  torsionFreeClosed : C.torsionFree
  metricCompatibleClosed : C.metricCompatible
  curvatureClosed : C.curvature

def ConnectionClosed {M : HomogeneousManifold} (C : ConnectionPackage M) : Prop :=
  C.torsionFree ∧ C.metricCompatible ∧ C.curvature

theorem connection_closed_from_evidence
    {M : HomogeneousManifold} (C : ConnectionPackage M) (E : ConnectionEvidence C) :
    ConnectionClosed C := by
  exact And.intro E.torsionFreeClosed (And.intro E.metricCompatibleClosed E.curvatureClosed)

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse