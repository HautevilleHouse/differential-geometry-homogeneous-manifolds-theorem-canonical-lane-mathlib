import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HomogeneousManifoldsCanonicalLaneLean.HomogeneousManifoldsCanonicalLaneLean

/-!
# Admissible Homogeneous Manifolds

This module defines the admissible-class structure for homogeneous manifolds.
-/

namespace HautevilleHouse
namespace HomogeneousManifoldsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure HomogeneousSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  group : Type
  groupTopology : TopologicalSpace group
  groupStructure : Group group
  continuousAction : ContinuousSMul group carrier
  transitiveAction : IsTransitiveAction group carrier

default instance : TopologicalSpace carrier := topology

structure AdmittedHomogeneousManifold (M : HomogeneousSpace) where
  riemannianMetric : Type
  metricSmooth : Prop
  curvatureInvariantsClosed : Prop
  homogeneousStructurePreserved : Prop
  conclusion : curvatureInvariantsClosed ∧ homogeneousStructurePreserved

def HomogeneousWitnessClosed (M : HomogeneousSpace) (A : AdmittedHomogeneousManifold M) : Prop :=
  A.curvatureInvariantsClosed ∧ A.homogeneousStructurePreserved

end HomogeneousManifoldsCanonicalLaneLean
end HautevilleHouse
