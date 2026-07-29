import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure ClassificationLowDimensionsPackage {M : Type u} [TopologicalSpace M] [SmoothManifold M] (P : HomogeneousStructurePackage M) where
  dimension : Nat
  maxDimensionClassified : Nat
  classificationComplete : Prop
  dimensionLessThanMax : Prop
  classificationCompleteTerm : classificationComplete
  dimensionLessThanMaxTerm : dimensionLessThanMax

structure ClassificationLowDimensionsEvidence {M : Type u} [TopologicalSpace M] [SmoothManifold M] {P : HomogeneousStructurePackage M} (C : ClassificationLowDimensionsPackage P) where
  classificationCompleteClosed : C.classificationComplete
  dimensionLessThanMaxClosed : C.dimensionLessThanMax

def ClassificationLowDimensionsClosed {M : Type u} [TopologicalSpace M] [SmoothManifold M] {P : HomogeneousStructurePackage M} (C : ClassificationLowDimensionsPackage P) : Prop :=
  C.classificationComplete ∧ C.dimensionLessThanMax

theorem classification_low_dimensions_closed_from_evidence
    {M : Type u} [TopologicalSpace M] [SmoothManifold M] {P : HomogeneousStructurePackage M}
    (C : ClassificationLowDimensionsPackage P) (E : ClassificationLowDimensionsEvidence C) :
    ClassificationLowDimensionsClosed C := by
  exact And.intro E.classificationCompleteClosed E.dimensionLessThanMaxClosed

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse