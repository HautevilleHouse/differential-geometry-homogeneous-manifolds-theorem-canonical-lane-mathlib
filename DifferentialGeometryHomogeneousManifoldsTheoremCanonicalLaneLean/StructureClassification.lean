import HautevilleHouse.HomogeneousManifoldsCanonicalLaneLean.IndexTheoremPackage

/-!
# Structure Classification Package

This module defines the classification of homogeneous Riemannian manifolds.
-/

namespace HautevilleHouse
namespace HomogeneousManifoldsCanonicalLaneLean

structure ClassificationData (M : HomogeneousSpace) where
  isotropyRepresentation : Type
  reductiveComplement : Prop
  ricciFlatCase : Prop
  einsteinCase : Prop
  symmetricCase : Prop
  naturallyReductive : Prop

default instance : TopologicalSpace M.carrier := M.topology

structure ClassificationEvidence {M : HomogeneousSpace} (C : ClassificationData M) where
  reductiveComplementClosed : C.reductiveComplement
  ricciFlatCaseClosed : C.ricciFlatCase
  einsteinCaseClosed : C.einsteinCase
  symmetricCaseClosed : C.symmetricCase
  naturallyReductiveClosed : C.naturallyReductive

def ClassificationClosed {M : HomogeneousSpace} (C : ClassificationData M) : Prop :=
  C.reductiveComplement ∧ C.ricciFlatCase ∧ C.einsteinCase ∧ C.symmetricCase ∧ C.naturallyReductive

theorem classification_closed_from_evidence
    {M : HomogeneousSpace} (C : ClassificationData M) (E : ClassificationEvidence C) :
    ClassificationClosed C := by
  exact And.intro E.reductiveComplementClosed
    (And.intro E.ricciFlatCaseClosed
      (And.intro E.einsteinCaseClosed
        (And.intro E.symmetricCaseClosed E.naturallyReductiveClosed)))

end HomogeneousManifoldsCanonicalLaneLean
end HautevilleHouse
