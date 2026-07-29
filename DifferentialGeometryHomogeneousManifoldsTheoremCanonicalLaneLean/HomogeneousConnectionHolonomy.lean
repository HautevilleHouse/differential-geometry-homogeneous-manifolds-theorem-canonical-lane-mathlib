import canonicalLaneMathlib.AdmissibleClass

/-!
# Homogeneous Connection and Holonomy Package

This module defines the Levi-Civita connection and holonomy group for a
homogeneous manifold. The fields record proof obligations for metric
compatibility, torsion-freeness, and holonomy reduction.
-/

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure HomogeneousConnectionPackage where
  connection : Type u
  holonomyGroup : Type v
  metricCompatibility : Prop
  torsionFree : Prop
  holonomyReduction : Prop
  holonomyLieSubalgebra : Prop
  holonomyInvariantUnderTransitiveAction : Prop

structure HomogeneousConnectionEvidence (C : HomogeneousConnectionPackage) where
  metricCompatibilityClosed : C.metricCompatibility
  torsionFreeClosed : C.torsionFree
  holonomyReductionClosed : C.holonomyReduction
  holonomyLieSubalgebraClosed : C.holonomyLieSubalgebra
  holonomyInvariantClosed : C.holonomyInvariantUnderTransitiveAction

def HomogeneousConnectionClosed (C : HomogeneousConnectionPackage) : Prop :=
  C.metricCompatibility ∧ C.torsionFree ∧ C.holonomyReduction ∧
  C.holonomyLieSubalgebra ∧ C.holonomyInvariantUnderTransitiveAction

theorem homogeneous_connection_closed_from_evidence
    (C : HomogeneousConnectionPackage) (E : HomogeneousConnectionEvidence C) :
    HomogeneousConnectionClosed C := by
  exact And.intro E.metricCompatibilityClosed
    (And.intro E.torsionFreeClosed
      (And.intro E.holonomyReductionClosed
        (And.intro E.holonomyLieSubalgebraClosed E.holonomyInvariantClosed)))

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse