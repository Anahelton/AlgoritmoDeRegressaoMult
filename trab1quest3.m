%TRABALHO 01 QUESTÃO 03
%JOSÉ ANAHELTON SOUSA FONTELES - 356721

%{
ENUNCIADO QUESTÃO 3:
Dada a base de dados abaixo, na qual a primeira e segunda colunas são as variáveis
regressoras (x1 e x2) e a terceira coluna é a variável dependente (y), determine o modelo
de regressão múltipla (plano) com parâmetros estimados pelo método dos mínimos
quadrados. Avalie a qualidade do modelo pela métrica R2.
%}

clc;
D = [122 139 0.115;
    114 126 0.120;
    086 090 0.105;
    134 144 0.090;
    146 163 0.100;
    107 136 0.120;
    068 061 0.105;
    117 062 0.080;
    071 041 0.100;
    098 120 0.115];

%Para facilitar a nomeclatura usei x1=x e x2=y.
x=D(:,1); %Associando x a todos os valores da primeira coluna.
y=D(:,2); %Associando y a todos os valores da segunda coluna.

n=length(y);

lambda = 0.001; %Definindo lambda para o calculo de beta.
plot(x,y,'.');

%Normalizando os valores para evitar erros.
x = x./max(x);
y = y./max(y);

X=[ones(n,1) x, x.^2];
[sx, sy] = size(X');
beta = (X'*X+lambda*eye(sx,sx))^(-1)*X'*y; %Regularização de Tikhonov
y_chap = beta(1)+beta(2)*x+beta(3)*x.^2; %Preditor
hold on
plot(x,y_chap); 
R2 = 1-sum((y-y_chap).^2)/sum((y-mean(y)).^2); %coeficiente de determinação R2
R2aj = 1-sum(((y-y_chap).^2)/(n-(sx+1)))/sum(((y-mean(y)).^2)/(n-1)); %coeficiente de determinação R2 ajustado
fprintf("R2 = %f\n", R2);
fprintf("R2 ajustado = %f\n", R2aj);
fprintf("\n");
