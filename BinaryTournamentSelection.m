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
%  BinaryTournamentSelection.m : implelemnts binary tournament  %
%                                selection                      %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function p=BinaryTournamentSelection(pop)

    npop=numel(pop);
    
    i=randi(npop,1,2); %randint depreciated
    
    p1=pop(i(1));
    p2=pop(i(2));
    
    if p1.Rank < p2.Rank
        p=p1;
    elseif p1.Rank > p2.Rank
        p=p2;
    else
        if p1.CrowdingDistance>p2.CrowdingDistance
            p=p1;
        else
            p=p2;
        end
    end

end