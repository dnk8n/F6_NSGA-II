%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  MATLAB Code for                                              %
%                                                               %
%  Non-dominated Sorting Genetic Algorithm II (NSGA-II)         %
%  Version 1.0 - April 2010                                     %
%                                                               %
%  Programmed By: S. Mostapha Kalami Heris                      %
%                                                               %
%         e-Mail: sm.kalami@gmail.com                           %
%                 kalami@ee.kntu.ac.ir                          %
%                                                               %
%       Homepage: http://www.kalami.ir                          %
%                                                               %
%  SortPopulation.m : performs sort operation according to      %
%                     rank and crowding distance, and           %
%                     prepares population before selection      %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function pop=SortPopulation(pop)

    CD=[pop.CrowdingDistance];
    [CD CD_sort_order]=sort(CD,'descend');
    pop=pop(CD_sort_order);
    
    R=[pop.Rank];
    [R R_sort_order]=sort(R);
    pop=pop(R_sort_order);
    
end