import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure HomogeneousManifold where
  carrier : Type
  topology : TopologicalSpace carrier
  smoothStructure : Prop
  lieGroupAction : Prop
  transitiveAction : Prop

structure HomogeneousManifoldAdmittedObject where
  manifold : HomogeneousManifold
  curvatureInvariant : Prop
  isotropyRep : Type
  homogeneousConnection : Prop
  conclusion : HomogeneousManifold → Prop

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse