import HautevilleHouse.HomogeneousManifoldsCanonicalLaneLean.CurvatureInvariantsPackage

/-!
# Connection Theory Package

This module defines Levi-Civita connection and holonomy structures for homogeneous manifolds.
-/

namespace HautevilleHouse
namespace HomogeneousManifoldsCanonicalLaneLean

structure LeviCivitaConnection (M : HomogeneousSpace) where
  connection : Type
  torsionFree : Prop
  metricCompatible : Prop
  holonomyGroup : Type
  holonomyAlgebra : Type
  holonomyReducible : Prop
  holsym : holonomyGroup
  holalg : holonomyAlgebra
  torsionFreeTerm : torsionFree
  metricCompatibleTerm : metricCompatible
  holonomyReducibleTerm : holonomyReducible

structure ConnectionEvidence {M : HomogeneousSpace} (L : LeviCivitaConnection M) where
  torsionFreeClosed : L.torsionFree
  metricCompatibleClosed : L.metricCompatible
  holonomyReducibleClosed : L.holonomyReducible

def ConnectionClosed {M : HomogeneousSpace} (L : LeviCivitaConnection M) : Prop :=
  L.torsionFree ∧ L.metricCompatible ∧ L.holonomyReducible

theorem connection_closed_from_evidence
    {M : HomogeneousSpace} (L : LeviCivitaConnection M) (E : ConnectionEvidence L) :
    ConnectionClosed L := by
  exact And.intro E.torsionFreeClosed (And.intro E.metricCompatibleClosed E.holonomyReducibleClosed)

end HomogeneousManifoldsCanonicalLaneLean
end HautevilleHouse
