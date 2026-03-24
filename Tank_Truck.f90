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


!
!PROGRAM TestCases
!  USE CW2
!  USE Solution
!  IMPLICIT NONE
 ! 
 ! CALL describe("tank_vol")
 !   CALL it("basic tests")
 !     CALL testing(5, 7, 3848, 2940)
 !     CALL testing(2, 7, 3848, 907)
 !     CALL testing(0, 7, 3848, 0)
 !     CALL testing(7, 7, 3848, 3848)
!
!    CALL endContext()
!  CALL endContext()

!CONTAINS
  
!  SUBROUTINE testing(h, d, vt, expect)
 !   USE Solution
!    INTEGER :: h, d, vt
!    INTEGER :: actual, expect
!    
!    print *, "h: ", h, " d", d, " vt ", vt
!    actual = tank_vol(h, d, vt)
!    PRINT *, "ACTUAL ", actual
!    PRINT *, "EXPECT ", expect
!    print *, expect == actual
!    call assertEquals(expect, actual)
!  END SUBROUTINE testing
  
!END PROGRAM TestCases
