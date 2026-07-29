import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.HomogeneousStructure

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure InvariantMetric (h : HomogeneousStructure M) where
  metric : RiemannianMetric M
  leftInvariant : ∀ g : h.lieGroup, (h.action g) * metric = metric
  isotropyInvariant : ∀ x : M, ∀ k : Stabilizer h.action x, (k : M → M) * metric = metric

def InvariantMetricClosed (im : InvariantMetric h) : Prop :=
  im.leftInvariant ∧ im.isotropyInvariant

structure InvariantMetricEvidence (im : InvariantMetric h) where
  leftInvariantClosed : im.leftInvariant
  isotropyInvariantClosed : im.isotropyInvariant

theorem invariant_metric_closed_from_evidence (im : InvariantMetric h) (e : InvariantMetricEvidence im) :
    InvariantMetricClosed im := by
  exact And.intro e.leftInvariantClosed e.isotropyInvariantClosed

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse