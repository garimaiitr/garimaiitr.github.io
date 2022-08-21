
1. **Softwares required**
- Install 20sim (version 4.7 or higher)
- Install Matlab 2019a or higher version.
- Go to https://www.20sim.com/webhelp/toolboxes_scripting_octavescriptingfolder.php to see the steps for creating the scripting folder.
- Copy all the files into scripting folder.
2. **Code for IT2FPD for problem OP1**
- Open file '9_link_snake_19-03-2021distb(type2-robust).emx' in 20sim software. Go to _Settings>Options>Scripting Interface_, select all the options in XMLRPC Interface.
- Run file '9_link_snake_19-03-2021distb(type2-robust).emx'.
- Run file 'FuzzyType2.m' to connect '9_link_snake_19-03-2021distb(type2-robust).emx' to Matlab.
- Open file 'optimize_type2_OP1.m' in Matlab.
- Upper and lower bound for the controller and GA parameters are set in file 'setParam.m'.
- Set problem = @optimize_type2_OP1 in 'setParam.m'.
- In file 'true_func.m' set f= optimize_type2_OP1(x).
- Run file 'rGA.m' for running the genetic algorithm.
4.  **Code for IT2FPD for problem OP2**
- Open file '9_link_snake_19-03-2021distb(type2-robust).emx' in 20sim software. Go to_Settings>Options>Scripting Interface_, select all the options in XMLRPC Interface.
- Run file '9_link_snake_19-03-2021distb(type2-robust).emx'.
- Run file 'FuzzyType2.m' to connect '9_link_snake_19-03-2021distb(type2-robust).emx' to Matlab.
- Open file 'optimize_type2.m' in Matlab.
- Upper and lower bound for the controller and GA parameters are set in file 'setParam.m'.
- Set problem = @optimize_type2 in 'setParam.m'.
- In file 'true_func.m' set f= optimize_type2(x).
- Run file 'rGA.m' for running the genetic algorithm.
6. **Code for T1FPD**
- Open file '9_link_snake_23-03-2021distb(type1-robust).emx' in 20sim software. Go to _Settings>Options>Scripting Interface_, select all the options in XMLRPC Interface.
- Run file '9_link_snake_23-03-2021distb(type1-robust).emx'.
- Run file 'FuzzyType1.m' to connect '9_link_snake_23-03-2021distb(type1-robust).emx' to Matlab.
- Open file 'optimize_type1.m' in Matlab.
- Upper and lower bound for the controller and GA parameters are set in file 'setParam1.m'.
- In file 'true_func.m' set f= optimize_type1(x).
- Open file 'rGA.m' and set [N, k, problem, ncon, Xmin, Xmax, max_gen, p_cross, p_mut, eta_c, eta_m] = setParam1();
- Run file 'rGA.m' for running the genetic algorithm.
8. **Code for PD**
-  Open file '9_link_snake_26-03-2021distb(pd).emx' in 20sim software. Go to _Settings>Options>Scripting Interface_, select all the options in XMLRPC Interface.
- Run file '9_link_snake_26-03-2021distb(pd).emx'.
- Run file 'Fuzzypd.m' to connect '9_link_snake_26-03-2021distb(pd).emx' to Matlab.
- Open file 'optimize_PD.m' in Matlab.
- Upper and lower bound for the controller and GA parameters are set in file 'setParampd.m'.
- In file 'true_func.m' set f= optimize_PD(x).
- Open file 'rGA.m' and set [N, k, problem, ncon, Xmin, Xmax, max_gen, p_cross, p_mut, eta_c, eta_m] = setParampd();
- Run file 'rGA.m' for running the genetic algorithm.

