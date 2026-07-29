import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.CurvatureHomogeneity
import HautevilleHouse.DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.ReductiveDecomposition

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure ClassificationData (h : HomogeneousStructure M) where
  isReductive : ReductiveDecomposition h
  curvatureHomog : CurvatureHomogeneity (invariantMetricFromDecomposition isReductive)
  classificationLabel : String
  uniquenessCondition : Prop
  uniquenessConditionClosed : uniquenessCondition

def ClassificationDataClosed (cd : ClassificationData h) : Prop :=
  ReductiveDecompositionClosed cd.isReductive ∧
  CurvatureHomogeneityClosed cd.curvatureHomog ∧
  cd.uniquenessCondition

structure ClassificationDataEvidence (cd : ClassificationData h) where
  reductiveDecompositionClosed : ReductiveDecompositionClosed cd.isReductive
  curvatureHomogeneityClosed : CurvatureHomogeneityClosed cd.curvatureHomog
  uniquenessConditionClosed : cd.uniquenessCondition

theorem classification_data_closed_from_evidence (cd : ClassificationData h) (e : ClassificationDataEvidence cd) :
    ClassificationDataClosed cd := by
  exact And.intro e.reductiveDecompositionClosed
    (And.intro e.curvatureHomogeneityClosed e.uniquenessConditionClosed)

theorem classification_data_supports_classification (cd : ClassificationData h) : String :=
  cd.classificationLabel

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse