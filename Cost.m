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
%  Cost.m : implements a bi-objective cost function             %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f=Cost(x)

%n=numel(x);

%f=[0 0];

%f(1)=sum(-10*exp(-0.2*sqrt(x(1:n-1).^2+x(2:n).^2)));
%f(2)=sum(abs(x).^0.8+5*sin(x.^3));

%%% MY ADDED CODE - DEAN KAYTON %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=0;
f(1)=0.5-((sin(sqrt(x(1).^2+x(2).^2))).^2-0.5)./((1+0.001.*(x(1).^2+x(2).^2)).^2);
f(1)=1-f(1);
%%% MY ADDED CODE - DEAN KAYTON %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end