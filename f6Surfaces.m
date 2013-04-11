%3D surface of the evaluation function
x=[-100:0.1:100]';
X=x(:,ones(size(x,1),1));
y=[-100:0.1:100];
Y=y(ones(size(y,2),1),:);
f6plot1=0.5-((sin(sqrt(X.^2+Y.^2))).^2-0.5)./((1+0.001.*(X.^2+Y.^2)).^2);
%figure(1)
subplot(2,3,1)
hold all
fig3d=surf(X,Y,f6plot1,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
title('3D - Evaluation Function vs Change in x&y-values');
xlabel('x-parameter');
ylabel('y-parameter');
zlabel('Evaluation Function Value');

%Assuming optimal y=0, 2D plot of evaluation function vs x-values
y1=0;
f6plot2a=0.5-((sin(sqrt(x.^2+y1.^2))).^2-0.5)./((1+0.001.*(x.^2+y1.^2)).^2);
%figure(2)
subplot(2,3,2)
hold all
fig2da=plot(x,f6plot2a);
title('2D - Evaluation Function vs Change in x-values');
xlabel('x-parameter');
ylabel('Evaluation Function Value');

%Assuming optimal x=0, 2D plot of evaluation function vs y-values
x1=0;
f6plot2b=0.5-((sin(sqrt(x1.^2+y.^2))).^2-0.5)./((1+0.001.*(x1.^2+y.^2)).^2);
%figure(3)
subplot(2,3,3)
hold all
fig2da=plot(y,f6plot2a);
title('2D - Evaluation Function vs Change in y-values');
xlabel('y-parameter');
ylabel('Evaluation Function Value');