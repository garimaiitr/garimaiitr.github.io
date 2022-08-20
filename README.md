# garimaiitr.github.io
1. **Softwares required**
- Install 20sim (version 4.7 or higher)
- Copy all the files into scripting folder once the 20sim software is installed.
- Install Matlab 2019a or higher version.
2. **Code for IT2FPD for problem OP1**
- Run file '9_link_snake_19-03-2021distb(type2-robust).emx' in 20sim software
- Run file 'FuzzyType2.m' to connect '9_link_snake_19-03-2021distb(type2-robust).emx' to Matlab.
- Open file 'optimize_type2_OP1.m' in Matlab.
- Upper and lower bound for the controller and GA parameters are set in file 'setParam.m'.
- Set problem = @optimize_type2_OP1 in 'setParam.m'.
- In file 'true_func.m' set f= optimize_type2_OP1(x).
- Run file 'rGA.m' for running the genetic algorithm.
3.  **Code for IT2FPD for problem OP2**
- Run file '9_link_snake_19-03-2021distb(type2-robust).emx' in 20sim software
- Run file 'FuzzyType2.m' to connect '9_link_snake_19-03-2021distb(type2-robust).emx' to Matlab.
- Open file 'optimize_type2.m' in Matlab.
- Upper and lower bound for the controller and GA parameters are set in file 'setParam.m'.
- Set problem = @optimize_type2 in 'setParam.m'.
- In file 'true_func.m' set f= optimize_type2(x).
- Run file 'rGA.m' for running the genetic algorithm.

