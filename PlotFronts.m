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
%  PlotFronts.m : plots individuals' cost data grouped          %
%                 by front (rank)                               %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function PlotFronts(pop,F)

    nf=numel(F);
    c=GetCosts(pop);
    
    h=linspace(0,2/3,nf);
    
    costs=cell(1,nf);
    legends=cell(1,nf);
    
    for f=1:nf
        costs{f}=c(:,F{f});
        legends{f}=['Front ' num2str(f)];
        
        color=hsv2rgb([h(f) 1 1]);
        
        plot(costs{f}(1,:),costs{f}(2,:),'*','color',color);
        hold on;
        
    end
    
    legend(legends);
    legend('Location','NorthEastOutside');
    
    hold off;

end