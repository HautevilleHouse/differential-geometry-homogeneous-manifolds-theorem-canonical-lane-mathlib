import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean

structure InvariantConnectionPackage {H : HomogeneousManifoldPackage} where
  connection : Type u
  connectionSmooth : Prop
  invariantUnderGroupAction : Prop
  parallelTransport : Prop

structure InvariantConnectionEvidence {H : HomogeneousManifoldPackage} (C : InvariantConnectionPackage H) where
  connectionSmoothClosed : C.connectionSmooth
  invariantUnderGroupActionClosed : C.invariantUnderGroupAction
  parallelTransportClosed : C.parallelTransport

def InvariantConnectionClosed {H : HomogeneousManifoldPackage} (C : InvariantConnectionPackage H) : Prop :=
  C.connectionSmooth ∧ C.invariantUnderGroupAction ∧ C.parallelTransport

theorem invariant_connection_closed_from_evidence {H : HomogeneousManifoldPackage} (C : InvariantConnectionPackage H) (E : InvariantConnectionEvidence C) : InvariantConnectionClosed C :=
  And.intro E.connectionSmoothClosed (And.intro E.invariantUnderGroupActionClosed E.parallelTransportClosed)

end DifferentialGeometryHomogeneousManifoldsTheoremCanonicalLaneLean
end HautevilleHouse