import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure InducedRiemannianMetricPackage {H : HomogeneousManifoldPackage} where
  metric : Type u
  groupInvariant : Prop
  positiveDefinite : Prop
  leviCivitaConnection : Type v

structure InducedRiemannianMetricEvidence {H : HomogeneousManifoldPackage} (M : InducedRiemannianMetricPackage H) where
  groupInvariantClosed : M.groupInvariant
  positiveDefiniteClosed : M.positiveDefinite

def InducedRiemannianMetricClosed {H : HomogeneousManifoldPackage} (M : InducedRiemannianMetricPackage H) : Prop :=
  M.groupInvariant ∧ M.positiveDefinite

theorem induced_riemannian_metric_closed_from_evidence {H : HomogeneousManifoldPackage} (M : InducedRiemannianMetricPackage H) (E : InducedRiemannianMetricEvidence M) : InducedRiemannianMetricClosed M :=
  And.intro E.groupInvariantClosed E.positiveDefiniteClosed

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse