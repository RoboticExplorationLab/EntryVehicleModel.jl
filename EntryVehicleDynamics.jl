# Need subroutine to calculate angle of attack

function entry_vehicle!(dX,X,p,t)
# Define Constants
    m = 100.0; # Vehicle Mass [kg]
    mu = 3.986E14; # Standard Grav Parameter (Earth) [m3s-2]
    rho_0 = 1.225; # First Atmospheric Paremeter [kg/m3]
    H = 8.434E3; # Atmospheric Scale Height [m]
    A = 10; #Area [m2]
    rho = rho_0*exp(-X[1]/H); #Exponential Atmosphere Model
    J =  [1 0 0; 0 1 0; 0 0 1];
    Torque = [1; 1; 1];
    C_A = 1.6; # Values at 0 angle of attack
    C_S = -.1;
    C_N = 0;
    C_T = 1; # Dummy value for coefficient

    # Velocity
    dX[1] = X[8];
    dX[2] = X[9];
    dX[3] = X[10];

    # Angular Velocity
    dX[4] = .5*X[5]*X[13] - .5*X[6]*X[12] + .5*X[7]*X[11];
    dX[5] = -.5*X[4]*X[13] + .5*X[6]*X[11] + .5*X[7]*X[12];
    dX[6] = .5*X[4]*X[12] - .5*X[5]*X[11] + .5*X[7]*X[13];
    dX[7] = -.5*X[4]*X[11] - .5*X[5]*X[12] - .5*X[6]*X[13];

    # Acceleration
    dX[8] = (1/m)*.5*C_A*rho*A*X[8]^2 - mu*X[1]/X[1]^3; # Spherical Planet
    dX[9] = (1/m)*.5*C_S*rho*A*X[9]^2;
    dX[10] = -(1/m)*.5*C_N*rho*A*X[10]^2;

    # Angular Acceleration
    dX[11:13] = inv(J)*(Torque - cross( X[11:13], J*X[11:13] ));
    dX[14] = C_T*C_A*(rho*(sqrt(X[1]^2 + X[2]^2 + X[3]^2)^3)/2);
end
