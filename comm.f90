module comm
    use, intrinsic :: iso_c_binding, only: sp=>C_FLOAT, dp=>C_DOUBLE, int64=>C_LONG_LONG, sizeof=>c_sizeof
    implicit none
    
    complex(dp),parameter :: J=(0._dp, 1._dp)
    real(dp),parameter :: pi = 4._dp*atan(1._dp)

contains

subroutine init_random_seed()
    integer :: i, n, clock
    integer, allocatable :: seed(:)

    call random_seed(size=n)
    allocate(seed(n))
    call system_clock(count=clock)
    seed = clock + 37 * [ (i - 1, i = 1, n) ]
    call random_seed(put=seed)
end subroutine

pure subroutine err(msg)
  character(*), intent(in) :: msg
  error stop msg
end subroutine err

end module comm
