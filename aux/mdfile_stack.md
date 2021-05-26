# Optimal-control-of-double-integrator-problem
[Double integrator](https://en.wikipedia.org/wiki/Double_integrator) is a second order system relevant to many acceleration control problems like satellite attitude control. <br>

![image](https://raw.githubusercontent.com/PrajwalKoirala/mkd-image-hosting/main/1D_robot.png)
Assume a robot, constrained to move in an axis, whose acceleration can be directly controlled. 
**Differential Equation** <br>
$\ddot{x} =u(t)$ <br>

**State Space Equations**
$$\dot{x_1} =x_2 \\
\dot{x_2} =u$$
<br>
**Cost Function**
Objective: To minimize the the control effort as well as the operation time while guiding the system from initial state to the final state.
<br>
$$
J = t_f ^2 + \int_0^{t_f}  \frac{u^{2}}{2}dt .
$$
Constrained by the state space equations.<br>
Boundary Conditions: <br>
$$x_1(0) = 10, x_2(0) = 0 $$
$$x_1 (t_f)  = 0, x_2(t_f) = 0 $$
<br> 
## Solution
Hamiltonian for the problem is defined as:
$$H = u^2/2 + \lambda_1 x_2 + \lambda_2 u $$, where $\lambda_1$ and $\lambda_2$ are co-state variables.
<br>and 
$$\phi = t_f^2$$
1. Co-state equations:<br>
<br> $\dot{\lambda_1} = - \frac{\partial H}{\partial x_1} = 0$
<br>$\dot{\lambda_2} = - \frac{\partial H}{\partial x_2} = - \lambda_1$<br>
2. Optimal control equation:
	$$\frac{\partial H}{\partial u} = 0 \Rightarrow u = - \lambda_2$$
3. State and costate equations: <br>
	 $\dot{x_1} =x_2$<br>
	 $\dot{x_2} =u = - \lambda_2$<br>
	 $\dot{\lambda_1} = 0$<br>
	 $\dot{\lambda_2} =  - \lambda_1$<br>
	 We have four simultaneous first order differential equations and four boundary conditions: 
	 $$x_1(0) = 10, x_2(0) = 0 $$
$$x_1 (t_f)  = 0, x_2(t_f) = 0 $$
where, $t_f$ is given by<br>
 $$\frac{\partial \phi}{\partial t_f} = - H
\bigg\rvert_{t = t_f} $$

Above four coupled differential equations along with the boundary conditions  are solved in Matlab using symbolic toolbox. We get,
i. $t_f$ = 3.898 seconds
ii. $$u(t) = - \lambda_2(t) =  \frac{2*900^{2/5}} {15} * t - \frac{900^{3/5}}{15}  $$  
iii. $$x_2(t) =  \frac{900^{2/5}} {15} * t^2 - \frac{900^{3/5}}{15}*t  $$  
iv. $$x_1(t) =  \frac{900^{2/5}} {45} * t^3 - \frac{900^{3/5}}{30}*t^2 + 10  $$  



![image](https://raw.githubusercontent.com/PrajwalKoirala/mkd-image-hosting/main/graphs.png)

## Numerical Method
Matlab function [BVP4C](https://www.mathworks.com/help/matlab/ref/bvp4c.html) can be used to solve a boundary value problem for a defined time period. However, since we are dealing with a free end time problem, the trick is to introduce a dummy state by rescaling time so that $t_f$ is optimized as well.
<br>
Dummy state: $r = t_f \Rightarrow \dot{r} = 0$<br>
Rescaling time: $\tau = t/t_f, \tau \epsilon [0,1]$   <br>
So, $\partial{t} = t_f. \partial{\tau}$<br>
Rewriting the simultaneous differential equations for the scaled time $\tau \epsilon [0,1]$

$$
    \begin{pmatrix}
	 \dot{x_1} =x_2 \\
	 \dot{x_2} = - \lambda_2 \\
	 \dot{\lambda_1} = 0 \\
	 \dot{\lambda_2} =  - \lambda_1 \\
    \end{pmatrix}
    \longrightarrow
      \begin{pmatrix}
	 \dot{x_1} = x_2 *r \\
	 \dot{x_2} = - \lambda_2 *r  \\
	 \dot{\lambda_1} = 0 \\
	 \dot{\lambda_2} =  - \lambda_1 *r \\
	 \dot{r} =0\\
    \end{pmatrix}
$$
This is implemented in numerical_opt.m file.
