! Copyright (c), The Regents of the University of California
! Terms of use are as specified in LICENSE.txt
module neuron_m
  use string_m, only : string_t
  implicit none
  type :: neuron_t
    ! Define the variables and components of the neuron_t type
  end type neuron_t
  interface neuron_t
   pure recursive module function construct(neuron_lines,start) result(neuron)
      implicit none
      type(string_t), intent(in) :: neuron_lines(:)
      integer, intent(in) :: start
      type(neuron_t) neuron
    end function

  end interface
end module


module layer_m
  use neuron_m, only : neuron_t
  use string_m, only : string_t
  implicit none
  type layer_t
    type(neuron_t) neuron !! linked list of this layer's neurons 
    type(layer_t), allocatable :: next !! next layer
  end type

  interface layer_t
    recursive module function construct(layer_lines, start) result(layer)
      !! construct a linked list of layer_t objects from an array of JSON-formatted text lines
      implicit none
      type(string_t), intent(in) :: layer_lines(:)
      integer, intent(in) :: start
      type(layer_t), target :: layer
    end function

  end interface
end module


submodule(layer_m) layer_s
contains

  module procedure construct
    type(neuron_t) :: allocated_neuron
   
    allocated_neuron = neuron_t(layer_lines, start+1)
  end procedure

  

end submodule layer_s
