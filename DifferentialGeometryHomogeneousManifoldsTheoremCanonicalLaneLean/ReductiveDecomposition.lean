import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.HomogeneousStructure

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure ReductiveDecomposition (h : HomogeneousStructure M) where
  lieAlgebra : Type w
  [lieRing : LieRing lieAlgebra]
  [lieModule : Module ℝ lieAlgebra]
  isotropySubalgebra : LieSubalgebra ℝ lieAlgebra
  complement : Submodule ℝ lieAlgebra
  directSum : lieAlgebra = isotropySubalgebra ⊔ complement
  isotropyAdjointInvariant : ∀ X : isotropySubalgebra, ad X '' complement ⊆ complement
  complementAdjointInvariant : ∀ X : complement, ad X '' isotropySubalgebra ⊆ isotropySubalgebra

def ReductiveDecompositionClosed (rd : ReductiveDecomposition h) : Prop :=
  rd.directSum ∧ rd.isotropyAdjointInvariant ∧ rd.complementAdjointInvariant

structure ReductiveDecompositionEvidence (rd : ReductiveDecomposition h) where
  directSumClosed : rd.directSum
  isotropyAdjointInvariantClosed : rd.isotropyAdjointInvariant
  complementAdjointInvariantClosed : rd.complementAdjointInvariant

theorem reductive_decomposition_closed_from_evidence (rd : ReductiveDecomposition h) (e : ReductiveDecompositionEvidence rd) :
    ReductiveDecompositionClosed rd := by
  exact And.intro e.directSumClosed (And.intro e.isotropyAdjointInvariantClosed e.complementAdjointInvariantClosed)

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse