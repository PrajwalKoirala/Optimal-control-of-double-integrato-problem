solinit =bvpinit([0:0.01:1],[10;0;1;0;1]);
sol = bvp4c(@di_ode, @bcs, solinit);

t = sol.x.*sol.y(5,:); 
x1 = sol.y(1,:);
x2 = sol.y(2,:);
u = -sol.y(4,:);

figure; hold on;
subplot(3,1,1); plot(t,x1);
subplot(3,1,2); plot(t,x2);
subplot(3,1,3); plot(t,u);



function [y_dot] = di_ode(t,y)
% y  = [x1 x2 lambda1 lambda2 t_f]
y_dot = y(5).*[y(2); -y(4); 0; -y(3); 0];
end

function [res] = bcs(ya, yb)
res = [ya(1)-10; ya(2); yb(1); yb(2); 2*yb(5)-yb(4)^2/2+yb(3)*yb(2)];
end

