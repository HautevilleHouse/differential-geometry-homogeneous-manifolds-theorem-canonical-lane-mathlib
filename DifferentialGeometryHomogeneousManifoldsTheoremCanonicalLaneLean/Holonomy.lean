import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean.ConnectionTheory

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure HolonomyPackage {M : HomogeneousManifold} (C : ConnectionPackage M) where
  holonomyGroup : Type
  reducedHolonomy : Prop
  ambroseSinger : Prop
  berardBergery : Prop

structure HolonomyEvidence {M : HomogeneousManifold} {C : ConnectionPackage M} (H : HolonomyPackage C) where
  reducedHolonomyClosed : H.reducedHolonomy
  ambroseSingerClosed : H.ambroseSinger
  berardBergeryClosed : H.berardBergery

def HolonomyClosed {M : HomogeneousManifold} {C : ConnectionPackage M} (H : HolonomyPackage C) : Prop :=
  H.reducedHolonomy ∧ H.ambroseSinger ∧ H.berardBergery

theorem holonomy_closed_from_evidence
    {M : HomogeneousManifold} {C : ConnectionPackage M} (H : HolonomyPackage C) (E : HolonomyEvidence H) :
    HolonomyClosed H := by
  exact And.intro E.reducedHolonomyClosed (And.intro E.ambroseSingerClosed E.berardBergeryClosed)

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse