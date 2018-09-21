%计算力和力矩
function out = motorFM(in)
constant

%inputs
x = in(1);
x_dot = in(2);
y = in(3);
y_dot= in(4);
z = in(5);
z_dot= in(6);
roll = in(7);
roll_dot= in(8);
pitch = in(9);
pitch_dot= in(10);
yaw = in(11);
yaw_dot= in(12);
omega = in(13:16);


%Copied
V=sqrt(x_dot^2+y_dot^2); % horizontal speed [m/s]
v1=sqrt(-0.5*V^2+sqrt((0.5*V^2)^2+(w/(2*rho*A))^2)); % Inflow velocity [m/s]
lambda=(v1+z_dot)/(OmegaH*R); % Inflow ratio [less]
mu=V/(OmegaH*R); % advance ratio [less]
muX=x_dot/(OmegaH*R); % advance ratio in x axis [less]
muY=y_dot/(OmegaH*R); % advance ratio in y axis [less]

%Coefficients
Ct=sigma_*a*(((1/6)+(mu^2)/4)*theta0-((1+mu^2)*thetatw/8)-lambda/4);
ChX=sigma_*a*((muX*Cd/(4*a))+(0.25*lambda*muX*(theta0-0.5*thetatw)));
ChY=sigma_*a*((muY*Cd/(4*a))+(0.25*lambda*muY*(theta0-0.5*thetatw)));
Cq=sigma_*a*((1/(8*a))*(1+mu^2)*Cd+lambda*((theta0/6)-(thetatw/8)-(lambda/4)));
CrX= -sigma_*a*(muX*(theta0/6-thetatw/8-lambda/8));
CrY= -sigma_*a*(muY*(theta0/6-thetatw/8-lambda/8));

T = zeros(4,1);
Hx = zeros(4,1);
Hy = zeros(4,1);
Q = zeros(4,1);
RRx = zeros(4,1);
RRy = zeros(4,1);

for(i=1:4)
T(i) = Ct*rho*A*((omega(i)*R)^2); %推力
Hx(i) = ChX*rho*A*((omega(i)*R)^2); %x方向轴向力
Hy(i) = ChY*rho*A*((omega(i)*R)^2); %y方向轴向力
Q(i) = Cq*rho*A*((omega(i)^2)*(R)^3); %阻力 
RRx(i) = CrX*rho*A*((omega(i)^2)*(R)^3); %x方向滚转力矩分量
RRy(i) = CrY*rho*A*((omega(i)^2)*(R)^3); %y方向滚转力矩分量
end

%outputs
out(1:4)= T;
out(5:8)= Hx;
out(9:12)= Hy;
out(13:16)=Q;
out(17:20)= RRx;
out(21:24)= RRy;

end