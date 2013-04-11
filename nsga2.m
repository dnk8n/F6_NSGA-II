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
%  nsga2.m : main file of the program                           %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

CostFunction=@Cost;

npop=50;                                    % main population size - default 50
nvar=2;                                     % number of unknown variables - set to 3 for original @Cost
nobj=numel(CostFunction(zeros(1,nvar)));    % number of objective functions

maxit=200;                      % maximum number of iterations - default 100

VarMin=-100;                      % lower bound of unknown variables - set to -5 for original @Cost
VarMax= 100;                      % upper bound of unknown variables - set to 5 for original @Cost
VarRange=[VarMin VarMax];       % range of unknown variables

pc=0.8;                         % crossover ratio - default 0.8
nc=round(pc*npop/2)*2;          % number of parents (also offsprings)

pm=0.3;                         % mutation ratio - default 0.3
nm=round(pm*npop);              % number of mutants

%%%%%%%%%% MY ADDED CODE - DEAN KAYTON %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f6Surfaces;
bestEval=zeros(maxit,1);
avEval=zeros(maxit,1);
duration=zeros(maxit,1);
tic;
%%%%%%%%%% MY ADDED CODE - DEAN KAYTON %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialization
pop=CreateEmptyIndividuals(npop);
for i=1:numel(pop)
    pop(i).Position=unifrnd(VarMin,VarMax,[1 nvar]);
    pop(i).Cost=CostFunction(pop(i).Position);
end

% main loop
for it=1:maxit
    
    %%%%%%%% MY ADDED CODE - DEAN KAYTON %%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Find average and best solutions per generation
    duration(it)=toc;
    
    xyz=zeros(npop,3);
    for k=1:npop
        xyz(k,1:2)=pop(k,1).Position;
        xyz(k,3)=pop(k,1).Cost;
    end
    
    bestSol=find(xyz(:,3)==min(xyz(:,3))==1,1);
    bestEval(it,:)=1-xyz(bestSol,3);
    avEval(it,:)=mean(1-xyz(:,3));
    
    %figure(1)
    subplot(2,3,1)
    hold all
    fig1=scatter3(xyz(:,1),xyz(:,2),1-xyz(:,3),'black','filled');
    
    %figure(2)
    subplot(2,3,2)
    hold all
    fig2=scatter(xyz(:,1),1-xyz(:,3),'black','filled');
    
    %figure(3)
    subplot(2,3,3)
    hold all
    fig3=scatter(xyz(:,2),1-xyz(:,3),'black','filled');
    
    %figure(4)
    subplot(2,3,4)
    hold all
    fig4=scatter(duration(it),bestEval(it),'blue','filled');
    title('Real-Time Largest Evaluation Function Value');
    xlabel('Time(s)');
    ylabel('Evaluation Function Value');
    pause(0.1)
    
    %figure(5)
    subplot(2,3,5)
    hold all
    fig5=scatter(duration(it),avEval(it),'red','filled');
    title('Real-Time Average Evaluation Function Value');
    xlabel('Time(s)');
    ylabel('Evaluation Function Value');
    
    %figure(6)
    subplot(2,3,6)
    hold all
    fig6a=scatter(it,bestEval(it),'blue','filled');
    fig6a=scatter(it,avEval(it),'red','filled');
    title('Largest and Average Evaluation Function Value');
    xlabel('Generation Number');
    ylabel('Evaluation Function Value');
    legend('Largest','Average');
    
    if it~=maxit
        delete(fig1)
        delete(fig2)
        delete(fig3)
    end
    %%%%%%%% MY ADDED CODE - DEAN KAYTON %%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [pop F]=NonDominatedSorting(pop);
    
    pop=CalcCrowdingDistance(pop,F);
    
    disp(['Iteration ' num2str(it) ':  Number of 1st Front Individuals = ' num2str(numel(F{1}))]);
    
    if it==maxit
        break;
    end
    
    pop2=CreateEmptyIndividuals(nc);
    for k=1:nc/2
        p1=BinaryTournamentSelection(pop);
        p2=BinaryTournamentSelection(pop);
        
        ch=Crossover(p1,p2);
        
        ch(1).Cost=CostFunction(ch(1).Position);
        ch(2).Cost=CostFunction(ch(2).Position);
        
        pop2(2*k-1)=ch(1);
        pop2(2*k)=ch(2);
    end
    
    pop3=CreateEmptyIndividuals(nm);
    for k=1:nm
        p=BinaryTournamentSelection(pop);
        
        q=Mutate(p,VarRange);
        
        q.Cost=CostFunction(q.Position);
        
        pop3(k)=q;
    end
    
    pop=[pop
        pop2
        pop3];
    
    [pop F]=NonDominatedSorting(pop);
    
    pop=CalcCrowdingDistance(pop,F);
    
    pop=SortPopulation(pop);
    
    pop=pop(1:npop);
    
end

%PlotFronts(pop,F);
