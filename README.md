# Optimal-control-of-double-integrator-problem
[Double integrator ](https://en.wikipedia.org/wiki/Double_integrator) is a second order system relevant to many acceleration control problems like satellite attitude control. <br>
**Differential Equation** <br>
$\ddot{x} =u(t)$ <br>

**State Space Equations**<br>
$\dot{x_1} =x_2$<br>
$\dot{x_2} =u$
<br>
**Cost Function**<br>
$$
J = t_f ^2 + \int_0^{t_f}  u^{2}dt\,.
$$
Constrained by the state space equations.<br>
Boundary Conditions: <br>
$$x_1(0) = 10, x_2(0) = 0 $$
$$x_1 (t_f)  = 0, x_2(t_f) = 0 $$
<br> Objective: To minimize the the control effort as well as the operation time while guiding the system from initial state to the final state.
<br>
## Solution
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

