MODULE Solution
  IMPLICIT NONE
CONTAINS

  FUNCTION tank_vol(h, d, vt) RESULT(res)
    INTEGER, INTENT(IN) :: h, d, vt
    INTEGER :: res

    INTEGER, PARAMETER :: ikind = selected_real_kind(15)
    REAL(KIND=ikind) :: r, hh, total_r
    REAL(KIND=ikind) :: theta, area, length, pi

    ! radius
    r = REAL(d, ikind) / 2.0_ikind
    hh = REAL(h, ikind)
    total_r = r - hh

    ! pi
    pi = acos(-1.0_ikind)

    ! cylinder length
    length = REAL(vt, ikind) / (pi * r * r)

    ! circular segment area
    theta = acos(total_r / r)
    area  = r*r*theta - total_r * sqrt(2.0_ikind*r*hh - hh*hh)

    ! truncate to integer
    res = INT(area * length)
  END FUNCTION tank_vol

END MODULE Solution

