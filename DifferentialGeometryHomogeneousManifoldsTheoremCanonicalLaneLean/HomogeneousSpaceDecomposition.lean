import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure HomogeneousSpaceDecompositionPackage {H : HomogeneousManifoldPackage} where
  reductiveDecomposition : Prop
  isotropyRepresentation : Prop
  adjointAction : Prop
  geodesicCompleteness : Prop

structure HomogeneousSpaceDecompositionEvidence {H : HomogeneousManifoldPackage} (D : HomogeneousSpaceDecompositionPackage H) where
  reductiveDecompositionClosed : D.reductiveDecomposition
  isotropyRepresentationClosed : D.isotropyRepresentation
  adjointActionClosed : D.adjointAction
  geodesicCompletenessClosed : D.geodesicCompleteness

def HomogeneousSpaceDecompositionClosed {H : HomogeneousManifoldPackage} (D : HomogeneousSpaceDecompositionPackage H) : Prop :=
  D.reductiveDecomposition ∧ D.isotropyRepresentation ∧ D.adjointAction ∧ D.geodesicCompleteness

theorem homogeneous_space_decomposition_closed_from_evidence {H : HomogeneousManifoldPackage} (D : HomogeneousSpaceDecompositionPackage H) (E : HomogeneousSpaceDecompositionEvidence D) : HomogeneousSpaceDecompositionClosed D :=
  And.intro E.reductiveDecompositionClosed (And.intro E.isotropyRepresentationClosed (And.intro E.adjointActionClosed E.geodesicCompletenessClosed))

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse