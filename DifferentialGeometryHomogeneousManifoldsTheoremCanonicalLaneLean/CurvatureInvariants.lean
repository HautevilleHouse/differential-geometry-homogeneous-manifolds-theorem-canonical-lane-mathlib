import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure CurvatureInvariantPackage {H : HomogeneousManifoldPackage} {C : InvariantConnectionPackage H} where
  curvatureTensor : Type u
  ricciCurvature : Type v
  scalarCurvature : Type w
  invariantUnderGroup : Prop
  curvingClosed : Prop

structure CurvatureInvariantEvidence {H : HomogeneousManifoldPackage} {C : InvariantConnectionPackage H} (R : CurvatureInvariantPackage H C) where
  invariantUnderGroupClosed : R.invariantUnderGroup
  curvingClosedClosed : R.curvingClosed

def CurvatureInvariantClosed {H : HomogeneousManifoldPackage} {C : InvariantConnectionPackage H} (R : CurvatureInvariantPackage H C) : Prop :=
  R.invariantUnderGroup ∧ R.curvingClosed

theorem curvature_invariant_closed_from_evidence {H : HomogeneousManifoldPackage} {C : InvariantConnectionPackage H} (R : CurvatureInvariantPackage H C) (E : CurvatureInvariantEvidence R) : CurvatureInvariantClosed R :=
  And.intro E.invariantUnderGroupClosed E.curvingClosedClosed

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse