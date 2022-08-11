
!   
!   A method of read line in fortran language
!
!   filename: file name, a string
!
!   line: target line, integer
!
!   A: input array, one dimension, support Float double int and longlong
!
!   Dragon  2022/8/11
!


module readAPI
    implicit none
    interface getLine
        module procedure  getLineFloat, &
            getLineDouble,getLineInt32, &
            getLineInt64
    end interface getLine
    contains
    subroutine getLineFloat(filename,line,A)
        character(len=*)::filename
        real(kind=4) A(:)
        integer line,i
        close(666)
        open(666,file=filename)
        do i=1,line
            if(i/=line)then 
                read(666,*)
                cycle
            end if
            read(666,*)A
        end do
        close(666)
    end subroutine getLineFloat
    subroutine getLineDouble(filename,line,A)
        character(len=*)::filename
        real(kind=8) A(:)
        integer line,i
        close(666)
        open(666,file=filename)
        do i=1,line
            if(i/=line)then 
                read(666,*)
                cycle
            end if
            read(666,*)A
        end do
        close(666)
    end subroutine getLineDouble
    subroutine getLineInt32(filename,line,A)
        character(len=*)::filename
        integer(kind=4) A(:)
        integer line,i
        close(666)
        open(666,file=filename)
        do i=1,line
            if(i/=line)then 
                read(666,*)
                cycle
            end if
            read(666,*)A
        end do
        close(666)
    end subroutine getLineInt32
    subroutine getLineInt64(filename,line,A)
        character(len=*)::filename
        integer(kind=8) A(:)
        integer line,i
        close(666)
        open(666,file=filename)
        do i=1,line
            if(i/=line)then 
                read(666,*)
                cycle
            end if
            read(666,*)A
        end do
        close(666)
    end subroutine getLineInt64
end module readAPI

program test
    use readAPI
    implicit none
    real A(2)
    integer l
    read(*,*)l
    call getLine("1.dat",l+1,A)
    print *,A
    call getLine("1.dat",l,A)
    print *,A
end program test