! Copyright (c), The Regents of the University of California
! Terms of use are as specified in LICENSE.txt
module neuron_m
  implicit none
  !use string_m, only : string_t
  type :: neuron_t
    ! Define the variables and components of the neuron_t type
  end type neuron_t
  interface neuron_t
   pure recursive module function construct(start) result(neuron)
      implicit none
      integer, intent(in) :: start
      type(neuron_t) neuron
    end function

  end interface
end module

submodule(neuron_m) neuron_s
contains

  module procedure construct
    type(neuron_t) :: allocated_neuron
    allocated_neuron = neuron_t(start+1)
  end procedure

  

end submodule neuron_s
