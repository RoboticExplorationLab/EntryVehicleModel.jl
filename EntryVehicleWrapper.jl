using DifferentialEquations
using LinearAlgebra

include("EntryVehicleDynamics.jl")
# Dummy Initial Conditions
    X0 = zeros(14)
    X0[1] = 100000.0;
    X0[2] = 0;
    X0[3] = 0;
    X0[4] = 1;
    X0[5] = 0;
    X0[6] = 0;
    X0[7] = 0;
    X0[8] = 1000.0;
    X0[9] = 0;
    X0[10] = 0;
    X0[11] = 0;
    X0[12] = 0;
    X0[13] = 0;
    X0[14] = 300;

tspan = (0.0,5.0)
prob = ODEProblem(entry_vehicle!, X0, tspan)
sol = solve(prob)
