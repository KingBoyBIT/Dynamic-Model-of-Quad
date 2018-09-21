% 常数值
sp= 0.01;% [s] 采样周期，仅在dinamics.m计算YiA项用到
g= 9.806;% [m/s^2] 重力加速度
b= 3.13E-5;% [N.s2] 悬停推力系数
d= 7.5E-7;% [Nm.s2] 悬停阻力系数
deg2rad=1.745329E-2; % [rad/deg]角度变换
rad2deg=57.295779; % [deg/rad]角度变换
P=4;% 电机个数
L= 0.232;% [m] 悬臂长度
m = 0.53;% [kg] 总质量
Ixx = 6.228E-3;	%// [kg.m2] 惯性系数
Iyy = 6.228E-3;	%// [kg.m2] 惯性系数
Izz = 1.121E-2;	%// [kg.m2] 惯性系数

%***** Rotor inertia *****/
r=4; % reduction ratio
jm= 4e-7;	%// [kg.m2]; 
jp= 6e-5;	%// [kg.m2]; 
jr = jp+jm/r;	%// [kg.m2];

h= 0; %// [m] 重心所在高度

%***** constants of the linear curve Omega=f(bin) *****
slo=2.7542; % slope (of the linear curve om=f(bin))
shi=3.627; % shift

% *************************** 空气动力 ***************************

% ********* 桨 ********* 
N=2; % 桨叶个数
R=0.15; % [m] 桨半径
A=pi*(R^2); % [m^2] 桨圆面积
c=0.0394; % [m] 桨弦长
theta0=0.2618; % [rad] 桨攻角
thetatw=0.045; % [rad] 桨扭转角
sigma_=(N*c)/(pi*R); % solidity ratio (rotor fill ratio) [rad^-1]
a=5.7; % 升力系数斜率 (given in literature)
Cd=0.052; % 阻力系数 -- found by tests
Ac=0.005; % [m^2] 中心毂面积

rho= 1.293; % [kg/m^3] 空气密度
nu=1.8e-5; % [Pa.s] 20度下空气粘性

w=(m/P)*g; % [N] 每个电机承担的总重分量
OmegaH=sqrt(w/b); % [rad/s] 悬停角速度
OmegaMax = 600; %[rad/s] 最大角速度
% ********* 纵向阻力系数 *********
Cx=1.32; 
Cy=1.32; 
Cz=1.32; 

Vol=3.04E-4; 	% [m3] 体积
PArchim = rho*g*Vol; % [N] 空气浮力
% ***** ANNEXE ! ******
%Ftb=0.5*Cz*A*rho*v^2 % turbulent
%Fl=16*0.3*nu*v % laminary 