// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VsimpleMips.h for the primary calling header

#include "VsimpleMips__pch.h"
#include "VsimpleMips__Syms.h"
#include "VsimpleMips___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VsimpleMips___024root___dump_triggers__act(VsimpleMips___024root* vlSelf);
#endif  // VL_DEBUG

void VsimpleMips___024root___eval_triggers__act(VsimpleMips___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VsimpleMips__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VsimpleMips___024root___eval_triggers__act\n"); );
    // Body
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VsimpleMips___024root___dump_triggers__act(vlSelf);
    }
#endif
}
