clear all
syms x1 x2 l1 l2 u t 'real'        
x = [x1; x2];
l = [l1; l2];
fx = [x2; u];
H = u*u/2 + l1*x2 + u* l2;
u = solve (diff(H,u) == 0, u);
%%
fx = [x2; u];
fgx = [fx; jacobian(H,x).'];

% fgx = [fx; jacobian(H,x)'];


xandl = [x1; x2; l1; l2];



for i  = 1: length(xandl)
    eqn{i} = strcat( 'D',char(xandl(i)), '=', char(fgx(i)) );
end

soln = dsolve(eqn{1},eqn{2},eqn{3},eqn{4});
save('temp.mat','-struct','soln')
load temp.mat

t_f = sym('t_f', 'positive'); phi = t_f^2;


bc1 = subs(soln.x1,t,0) == 10;
bc2 = subs(soln.x2,t,0) == 0;
bc3 = subs(soln.x1,t,t_f) == 0;
bc4 = subs(soln.x2,t,t_f) == 0;
eqnt = diff(phi, t_f) == -simplify(subs( subs(subs(H)), t, t_f));

syms C1 C2 C3 C4 'real'

% consts = solve(bc1, bc2); 
% save('temp_consts.mat','-struct','consts');
% load temp_consts.mat;




%%
consts = solve(bc1, bc2, bc3, bc4, eqnt);
save('temp_cons.mat','-struct','consts');
load temp_cons.mat;

u = (-(subs(l2)))
x1 = ((subs(x1)))
x2 = ((subs(x2)))

%%
figure; ezplot(x1,[0 double(t_f)])
figure; ezplot(x2,[0 double(t_f)])
figure; ezplot(u,[0 double(t_f)])
