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
%  Mutate.m : implements the mutation operator                  %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function q=Mutate(p,VarRange)

    VarMin=min(VarRange);
    VarMax=max(VarRange);
    
    y=p.Position;
    
    j=randi([1 numel(y)]);
    y(j)=unifrnd(VarMin,VarMax);

    q=CreateEmptyIndividuals();
    q.Position=y;
    
end