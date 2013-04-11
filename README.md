F6_NSGA-II
==========

Edited NSGA-II program (MATLAB) to optimise F6 Schaffer's Function, including a real-time graphical display of the results

	***Also have a look at [the much more basic genetic algorithm I coded myself](http://redd.it/1c0852)***

Here, I have attached a graphical display of the results to an already complete MATLAB implementation ([downloadable here](http://delta.cs.cinvestav.mx/~ccoello/EMOO/NSGA-II-Matlab.zip), developed by [S. Mostapha Kalami Heris](http://www.kalami.ir/) at K. N. Toosi University of Technology, Tehran, Iran) of Deb, et al's [Improved Non-dominated Sorting Genetic algorith (NSGA-II)](http://www.iitk.ac.in/kangal/Deb_NSGA-II.pdf). This type of genetic algorithm is designed with multi-objective optimization problems in mind but it also works well at optimizing single-objective problems. I have edited the objective function (cost.m) by substituting the original function (commented out) with the F6 Schaffers function (Single-objective, 2 unknown variables)

[You can learn the basics of GAs really easily](http://www.obitko.com/tutorials/genetic-algorithms/) but this is a much more advanced variation ([view more of Deb's research](http://www.iitk.ac.in/kangal/deb_research.shtml)). If you would like to see more current Multi-Objective Evolutionary Algorithms I recommend looking at [Coello Coello's Repository](http://delta.cs.cinvestav.mx/~ccoello/EMOO/EMOOsoftware.html) and also at the rest of his website.

Shaffer's F6 function is a testing function which includes many oscillations/peaks which are particularly difficult for traditional hill-climbing optimization techniques to converge to a global optimum (instead, solutions are 'trapped' at local optima). The F6 function is designed to have its peak at the origin with a value of one. Included in the download is 'f6Surfaces.m' which includes a 3D surface of the function (x-parameter, y-parameter and evaluation function values) as well as a couple of 2D plot (x-value set to equal zero (it's optimal), with y-values being plotted against 'cost', the same procedure is carried out swapping x-and-y values).

If you run 'nsga2.m' you will see 3 further plots. One is the maximum objective value vs time(s) and the other is the average of all the objective values vs time. A third plot merges the two previous ones together, with generation number displayed along the x-axis instead of time.
