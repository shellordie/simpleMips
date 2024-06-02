// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VSIMPLEMIPS__SYMS_H_
#define VERILATED_VSIMPLEMIPS__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "VsimpleMips.h"

// INCLUDE MODULE CLASSES
#include "VsimpleMips___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)VsimpleMips__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VsimpleMips* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VsimpleMips___024root          TOP;

    // CONSTRUCTORS
    VsimpleMips__Syms(VerilatedContext* contextp, const char* namep, VsimpleMips* modelp);
    ~VsimpleMips__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
