// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VsimpleMips.h for the primary calling header

#include "VsimpleMips__pch.h"
#include "VsimpleMips__Syms.h"
#include "VsimpleMips___024root.h"

void VsimpleMips___024root___ctor_var_reset(VsimpleMips___024root* vlSelf);

VsimpleMips___024root::VsimpleMips___024root(VsimpleMips__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VsimpleMips___024root___ctor_var_reset(this);
}

void VsimpleMips___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VsimpleMips___024root::~VsimpleMips___024root() {
}
