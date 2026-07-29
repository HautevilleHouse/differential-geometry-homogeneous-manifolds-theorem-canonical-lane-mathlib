import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure HomogeneousStructure (M : Type u) [TopologicalSpace M] [SmoothManifold M] where
  lieGroup : Type v
  [group : Group lieGroup]
  [smoothGroup : SmoothManifold lieGroup]
  action : lieGroup → M → M
  transitiveAction : ∀ x y : M, ∃ g : lieGroup, action g x = y
  smoothAction : Smooth (fun (g : lieGroup, x : M) => action g x)
  isotropyClosed : ∀ x : M, Subgroup (Stabilizer action x)

def HomogeneousStructureClosed (h : HomogeneousStructure M) : Prop :=
  h.transitiveAction ∧ h.smoothAction ∧ h.isotropyClosed

structure HomogeneousEvidence (h : HomogeneousStructure M) where
  transitiveActionClosed : h.transitiveAction
  smoothActionClosed : h.smoothAction
  isotropyClosedClosed : h.isotropyClosed

theorem homogeneous_closed_from_evidence (h : HomogeneousStructure M) (e : HomogeneousEvidence h) :
    HomogeneousStructureClosed h := by
  exact And.intro e.transitiveActionClosed (And.intro e.smoothActionClosed e.isotropyClosedClosed)

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse