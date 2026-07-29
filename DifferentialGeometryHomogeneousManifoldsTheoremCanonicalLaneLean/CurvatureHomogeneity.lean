import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.InvariantMetric

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure CurvatureHomogeneity (im : InvariantMetric h) where
  ricciConstant : ℝ
  scalarConstant : ℝ
  ricciIsScalarTimesMetric : im.Ricci = ricciConstant • im.metric
  scalarConstantDef : im.ScalarCurvature = scalarConstant

def CurvatureHomogeneityClosed (ch : CurvatureHomogeneity im) : Prop :=
  ch.ricciIsScalarTimesMetric ∧ ch.scalarConstantDef

structure CurvatureHomogeneityEvidence (ch : CurvatureHomogeneity im) where
  ricciIsScalarTimesMetricClosed : ch.ricciIsScalarTimesMetric
  scalarConstantDefClosed : ch.scalarConstantDef

theorem curvature_homogeneity_closed_from_evidence (ch : CurvatureHomogeneity im) (e : CurvatureHomogeneityEvidence ch) :
    CurvatureHomogeneityClosed ch := by
  exact And.intro e.ricciIsScalarTimesMetricClosed e.scalarConstantDefClosed

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse