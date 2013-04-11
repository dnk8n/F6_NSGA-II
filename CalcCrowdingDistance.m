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
%  CalcCrowdingDistance.m : claculates crowding distances       %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function pop=CalcCrowdingDistance(pop,F)

    nobj=numel(pop(1).Cost);

    nf=numel(F);
    for f=1:nf
        
        A=F{f};
        C=GetCosts(pop(A));
        D=zeros(size(C));
        for j=1:nobj
            
            [SCj k]=sort(C(j,:));
            
            D(j,k(1))=inf;
            D(j,k(end))=inf;
            D(j,k(2:end-1))=(SCj(3:end)-SCj(1:end-2))/(SCj(end)-SCj(1));
        end
        
        D=sum(D,1);
        for i=1:numel(A)
            pop(A(i)).CrowdingDistance=D(i);
        end
        
    end

end