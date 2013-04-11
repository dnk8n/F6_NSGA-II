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
%  CreateEmptyIndividuals.m : creates an array of strucures     %
%                             to save individuals' data         %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function pop=CreateEmptyIndividuals(n)

    if nargin<1
        n=1;
    end
    
    individual.Position=[];
    individual.Cost=[];
    individual.Rank=[];
    individual.CrowdingDistance=[];
    individual.DominationSet=[];
    individual.DominatedCount=[];
    
    pop=repmat(individual,n,1);
    
end