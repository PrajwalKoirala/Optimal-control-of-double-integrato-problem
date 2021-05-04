clear all
syms x1 x2 l1 l2 u
x = [x1; x2];
l = [l1; l2];
fx = [x2; u];
H = u*u/2 + l.' * fx;
u_new = solve (diff(H,u) == 0, u);
fx = [x2; u_new];
fgx = [fx; jacobian(H,x).'];

% fgx = [fx; jacobian(H,x)'];


xandl = [x1; x2; l1; l2];



for i  = 1: length(xandl)
    eqn{i} = strcat( 'D',char(xandl(i)), '=', char(fgx(i)) );
end

soln = dsolve(eqn{1},eqn{2},eqn{3},eqn{4});

t = 0;      bc1 = subs(soln.x1) == 10;
t = 0;      bc2 = subs(soln.x2) == 0;
t = 3.9;    bc3 = subs(soln.x1) == 0;
t = 3.9;    bc4 = subs(soln.x2) == 0;
[C1 C2 C3 C4]= solve(bc1, bc2, bc3, bc4);

syms t
u = - (subs(soln.l2))


% dsolve(diff(xandl,t) == fgx)