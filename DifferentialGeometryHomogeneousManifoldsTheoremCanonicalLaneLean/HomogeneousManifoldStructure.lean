import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure HomogeneousManifoldPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Type v
  lieGroup : Type w
  groupTopology : TopologicalSpace lieGroup
  groupSmooth : Type x
  transitiveAction : Prop
  isotropySubgroup : Prop
  homogeneousStructure : Prop

structure HomogeneousManifoldEvidence (H : HomogeneousManifoldPackage) where
  transitiveActionClosed : H.transitiveAction
  isotropySubgroupClosed : H.isotropySubgroup
  homogeneousStructureClosed : H.homogeneousStructure

def HomogeneousManifoldClosed (H : HomogeneousManifoldPackage) : Prop :=
  H.transitiveAction ∧ H.isotropySubgroup ∧ H.homogeneousStructure

theorem homogeneous_manifold_closed_from_evidence (H : HomogeneousManifoldPackage) (E : HomogeneousManifoldEvidence H) : HomogeneousManifoldClosed H :=
  And.intro E.transitiveActionClosed (And.intro E.isotropySubgroupClosed E.homogeneousStructureClosed)

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse