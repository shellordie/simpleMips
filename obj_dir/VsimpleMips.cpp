// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VsimpleMips__pch.h"

//============================================================
// Constructors

VsimpleMips::VsimpleMips(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VsimpleMips__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

VsimpleMips::VsimpleMips(const char* _vcname__)
    : VsimpleMips(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VsimpleMips::~VsimpleMips() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VsimpleMips___024root___eval_debug_assertions(VsimpleMips___024root* vlSelf);
#endif  // VL_DEBUG
void VsimpleMips___024root___eval_static(VsimpleMips___024root* vlSelf);
void VsimpleMips___024root___eval_initial(VsimpleMips___024root* vlSelf);
void VsimpleMips___024root___eval_settle(VsimpleMips___024root* vlSelf);
void VsimpleMips___024root___eval(VsimpleMips___024root* vlSelf);

void VsimpleMips::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VsimpleMips::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VsimpleMips___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VsimpleMips___024root___eval_static(&(vlSymsp->TOP));
        VsimpleMips___024root___eval_initial(&(vlSymsp->TOP));
        VsimpleMips___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VsimpleMips___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool VsimpleMips::eventsPending() { return false; }

uint64_t VsimpleMips::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* VsimpleMips::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VsimpleMips___024root___eval_final(VsimpleMips___024root* vlSelf);

VL_ATTR_COLD void VsimpleMips::final() {
    VsimpleMips___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VsimpleMips::hierName() const { return vlSymsp->name(); }
const char* VsimpleMips::modelName() const { return "VsimpleMips"; }
unsigned VsimpleMips::threads() const { return 1; }
void VsimpleMips::prepareClone() const { contextp()->prepareClone(); }
void VsimpleMips::atClone() const {
    contextp()->threadPoolpOnClone();
}

//============================================================
// Trace configuration

VL_ATTR_COLD void VsimpleMips::trace(VerilatedVcdC* tfp, int levels, int options) {
    vl_fatal(__FILE__, __LINE__, __FILE__,"'VsimpleMips::trace()' called on model that was Verilated without --trace option");
}
