import canonicalLaneMathlib.AdmissibleClass

/-!
# Homogeneous Curvature Invariants Package

This module defines curvature invariants for homogeneous manifolds: the
Killing form, sectional curvature, Ricci tensor, and scalar curvature.
Each field carries proof obligations. Later modules compose these into the
ConstrainedHomogeneousManifoldsClosure.
-/

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure HomogeneousCurvaturePackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  g : Type v  -- metric
  killingForm : Type w
  sectionalCurvature : Type x
  ricciTensor : Type y
  scalarCurvature : Type z
  homogeneousStructure : Prop
  metricInvariantUnderTransitiveAction : Prop
  killingFormNondegenerate : Prop
  sectionalCurvatureFormula : Prop
  ricciFromSectional : Prop
  scalarTraceOfRicci : Prop

structure HomogeneousCurvatureEvidence (G : HomogeneousCurvaturePackage) where
  homogeneousStructureClosed : G.homogeneousStructure
  metricInvariantClosed : G.metricInvariantUnderTransitiveAction
  killingFormNondegenerateClosed : G.killingFormNondegenerate
  sectionalCurvatureFormulaClosed : G.sectionalCurvatureFormula
  ricciFromSectionalClosed : G.ricciFromSectional
  scalarTraceOfRicciClosed : G.scalarTraceOfRicci

def HomogeneousCurvatureClosed (G : HomogeneousCurvaturePackage) : Prop :=
  G.homogeneousStructure ∧
  G.metricInvariantUnderTransitiveAction ∧
  G.killingFormNondegenerate ∧
  G.sectionalCurvatureFormula ∧
  G.ricciFromSectional ∧
  G.scalarTraceOfRicci

theorem homogeneous_curvature_closed_from_evidence
    (G : HomogeneousCurvaturePackage) (E : HomogeneousCurvatureEvidence G) :
    HomogeneousCurvatureClosed G := by
  exact And.intro E.homogeneousStructureClosed
    (And.intro E.metricInvariantClosed
      (And.intro E.killingFormNondegenerateClosed
        (And.intro E.sectionalCurvatureFormulaClosed
          (And.intro E.ricciFromSectionalClosed E.scalarTraceOfRicciClosed))))

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse