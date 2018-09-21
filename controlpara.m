yaw = 0;
km = 7.5e-7;            %力矩系数
kf = 3.13e-5;           %升力系数

wh = sqrt(m*g/(4*kf));
aaa=inv([kf kf kf kf;
	0 -kf 0 kf;
	-kf 0 kf 0;
	-km km -km km]);

xf=3;
yf=4;
zf=5;

kpx = 0.50;             %x 0.96  0.113
kix = 0.01;
kdx = 0.8;
kpy = 5.0;                %y
kiy = 0.01;
kdy = 5.0;
kpz = 100.0;                %z
kiz = 1.0;
kdz = 10.0;

kpphi = 2000;            %滚转 15  193
kdphi = 100;                  %20
kptheta = kpphi;          %俯仰
kdtheta = kdphi;
kppsai = 0;           %偏航
kdpsai = 0;
kipsai = 0;