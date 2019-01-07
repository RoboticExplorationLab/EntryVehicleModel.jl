using DifferentialEquations
include("EntryVehicleDynamics.jl")
# Dummy Initial Conditions
X0 = zeros(15)
X0[1] = 100000.0;
X0[2] = 1000.0;
X0[3] = 1000.0;
X0[8] = 10.0;
X0[9] = 10.0;
X0[10] = 10.0;


tspan = (0.0,10.0)
prob = ODEProblem(entry_vehicle!, X0, tspan)
sol = solve(prob)
