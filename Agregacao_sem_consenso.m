clear;
clc;

criteria = 300; % number of criteria
DM = 4; % number of decision makers


%Initialization of the quadruple matrices with criterion, number of hesitant terms, criterion, decision maker.
judgments = zeros( criteria, DM );
linguisticJudgments = cell(criteria, DM);

criteriaMinimum = zeros(1, criteria);
criteriaMaximum = zeros(1, criteria);


% each running gererates one instance
% for another instances, the seed must be changed in "rng(seed)"
rng(94737);

% Generation of hesitant evaluations %

    for i = 1:criteria

        criteriaMinimum = randi([1,5]);
        criteriaMaximum = randi([11,15]);       
        
        for j = 1:DM
            
            %%%% DM normal
  
            % Define number of hesitant terms
            evaluation = randi([criteriaMinimum,criteriaMaximum]); 
            judgments(i, j) = evaluation;
            
             
      
            if judgments(i, j) == 1
                linguisticJudgments (i, j) = {'VL'};
          
            elseif judgments(i, j) == 2
                linguisticJudgments (i, j) = {'VL-L'};
            elseif judgments(i, j) == 3
                linguisticJudgments (i, j) = {'VL-M'};
            elseif judgments(i, j) == 4
                linguisticJudgments (i, j) = {'L'};
            elseif judgments(i, j) == 5
                linguisticJudgments (i, j) = {'VL-H'};
            elseif judgments(i, j) == 6
                linguisticJudgments (i, j) = {'L-M'};
            elseif judgments(i, j) == 7
                linguisticJudgments (i, j) = {'VL-VH'};
            elseif judgments(i, j) == 8
                linguisticJudgments (i, j) = {'L-H'};
            elseif judgments(i, j) == 9
                linguisticJudgments (i, j) = {'M'};
            elseif judgments(i, j) == 10
                linguisticJudgments (i, j) = {'L-VH'};
            elseif judgments(i, j) == 11
                linguisticJudgments (i, j) = {'M-H'};
            elseif judgments(i, j) == 12
                linguisticJudgments (i, j) = {'M-VH'};
            elseif judgments(i, j) == 13
                linguisticJudgments (i, j) = {'H'};
            elseif judgments(i, j) == 14
                linguisticJudgments (i, j) = {'H-VH'};
            elseif judgments(i, j) == 15
                linguisticJudgments (i, j) = {'VH'};
            end
    end
    end


 %%%% Declaracao dos termos linguisticos %%%%%
 
 
 VL = [1,0,0,0,0];
 L =  [0,1,0,0,0];
 M =  [0,0,1,0,0];
 H =  [0,0,0,1,0];
 VH = [0,0,0,0,1];
 vetorAuxiliar = [0,1,2,3,4];


conjuntoDeAvaliacoes = linguisticJudgments;
LinhaColuna = size(conjuntoDeAvaliacoes); %retorna numero de linhas e colunas da matriz de avaliacoes
qtidadeLinhas = LinhaColuna(1);
qtidadeColunas = LinhaColuna(2);
numamostras=qtidadeLinhas;
numDecisores = qtidadeColunas;
similaridade = zeros(qtidadeLinhas, 1);
conjuntoDeAvaliacoesVetorizado = zeros(5,qtidadeLinhas,qtidadeColunas);


%%%% Converção das avaliacoes apos consenso %%%%%%%%%%%%%



for i = 1:qtidadeLinhas
    for j = 1:qtidadeColunas
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if strcmp(conjuntoDeAvaliacoes(i,j),'VL') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = VL;

        end
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'L') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = L;

        end
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'M') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = M;

        end   
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'H') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = H;

        end
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = VH;

        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'H-VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (H+VH)/2;

        end        
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'M-VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (M+H+VH)/3;

        end        
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'L-VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (L+M+H+VH)/4;

        end
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'VL-VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (VL+L+M+H+VH)/5;

        end    
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'M-H') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (M+H)/2;

        end
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'L-H') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (L+M+H)/3;

        end        
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'VL-H') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (VL+L+M+H)/4;

        end    
        
        if strcmp(conjuntoDeAvaliacoes(i,j),'L-M') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (L+M)/2;

        end        

        if strcmp(conjuntoDeAvaliacoes(i,j),'VL-M') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (VL+L+M)/3;

        end          

        if strcmp(conjuntoDeAvaliacoes(i,j),'VL-L') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (VL+L)/2;

        end          
      
        
    end

end


%%%%%%%%%%%%% Agregacao %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
 VL = [1,0,0,0,0];
 L =  [0,1,0,0,0];
 M =  [0,0,1,0,0];
 H =  [0,0,0,1,0];
 VH = [0,0,0,0,1];
 
 
 
 %%%%%%%% Convertendo avaliacoes para 1 ou 0 se o termo é ativado ou não %%
 
 
 for k = 1:5
    for i = 1:qtidadeLinhas
        for j = 1:qtidadeColunas
        
        
            if conjuntoDeAvaliacoesVetorizado(k, i, j) > 0
                
                conjuntoDeAvaliacoesVetorizado2(k, i, j)   = 1; 
 
            end
 
        end
    end
 end
 

 %%%%%% leitura para apenas os termos mais baixos %%%%%%
 
conjuntoDeAvaliacoesVetorizadoBaixo = zeros(5, qtidadeLinhas, qtidadeColunas);


for i = 1:qtidadeLinhas
    for j = 1:qtidadeColunas

conjuntoDeAvaliacoesVetorizadoBaixo(1:5, i, j) = [  0*conjuntoDeAvaliacoesVetorizado2(1, i, j)         0*conjuntoDeAvaliacoesVetorizado2(2, i, j)     0.25*conjuntoDeAvaliacoesVetorizado2(3, i, j)      0.5*conjuntoDeAvaliacoesVetorizado2(4, i, j)         0.75*conjuntoDeAvaliacoesVetorizado2(5, i, j) ];
 
    end
end

 %%%%%% leitura para apenas os termos medios %%%%%%
 
conjuntoDeAvaliacoesVetorizadoMedio = zeros(5, qtidadeLinhas, qtidadeColunas);


for i = 1:qtidadeLinhas
    for j = 1:qtidadeColunas

conjuntoDeAvaliacoesVetorizadoMedio(1:5, i, j) = [  0*conjuntoDeAvaliacoesVetorizado2(1, i, j)         0.25*conjuntoDeAvaliacoesVetorizado2(2, i, j)     0.50*conjuntoDeAvaliacoesVetorizado2(3, i, j)      0.75*conjuntoDeAvaliacoesVetorizado2(4, i, j)         1.0*conjuntoDeAvaliacoesVetorizado2(5, i, j) ];
 
    end
end

 %%%%%% leitura para apenas os termos mais altos %%%%%%
 
conjuntoDeAvaliacoesVetorizadoAlto = zeros(5, qtidadeLinhas, qtidadeColunas);


for i = 1:qtidadeLinhas
    for j = 1:qtidadeColunas

conjuntoDeAvaliacoesVetorizadoAlto(1:5, i, j) = [  0.25*conjuntoDeAvaliacoesVetorizado2(1, i, j)         0.50*conjuntoDeAvaliacoesVetorizado2(2, i, j)     0.75*conjuntoDeAvaliacoesVetorizado2(3, i, j)      1.0*conjuntoDeAvaliacoesVetorizado2(4, i, j)         1.0*conjuntoDeAvaliacoesVetorizado2(5, i, j) ];
 
    end
end

%%%%%%%%%%%% agregacao para o termo mais baixo do numero triangular %%            

peso(1)= 0.25;
peso(2)= 0.25;
peso(3)= 0.25;
peso(4)= 0.25;
     
   
     
  for f=1: qtidadeLinhas  
      
     n=1;
     result = 0;
     soma=0;
%      result2 = 0;
%      soma2=0;
     
    for t=1:5
       for k=1:5
            for j=1:5
                for m=1:5
                    
                     if conjuntoDeAvaliacoesVetorizado2(m, f, 1)==1 && conjuntoDeAvaliacoesVetorizado2(j, f, 2)==1 && conjuntoDeAvaliacoesVetorizado2(k, f, 3)==1   && conjuntoDeAvaliacoesVetorizado2(t, f, 4)==1                
                        
                        calc(n)= 1-(((1-conjuntoDeAvaliacoesVetorizadoBaixo(m, f, 1))^peso(1))*((1-conjuntoDeAvaliacoesVetorizadoBaixo(j, f, 2))^peso(2))*((1-conjuntoDeAvaliacoesVetorizadoBaixo(k, f, 3))^peso(3))*((1-conjuntoDeAvaliacoesVetorizadoBaixo(t, f, 4))^peso(4)));
                        
                        soma=soma+1;
                        result=result+calc(n);
                        
                        

                        
                    end
                    
                                                          
                    n=n+1;
                end
            end
        end     
    end   
    
       if soma == 0
                            
            soma = 1;
            
       end
                        

    HFWABaixo(f) =result/soma;
    

  end    
    
 %%%%%%%%%%%% agregacao para o termo medio do numero triangular %%%%%
 
 
   for f=1: qtidadeLinhas  
      
     n=1;
     result = 0;
     soma=0;

    for t=1:5
       for k=1:5
            for j=1:5
                for m=1:5
                    
                     if conjuntoDeAvaliacoesVetorizado2(m, f, 1)==1 && conjuntoDeAvaliacoesVetorizado2(j, f, 2)==1 && conjuntoDeAvaliacoesVetorizado2(k, f, 3)==1   && conjuntoDeAvaliacoesVetorizado2(t, f, 4)==1                
                        
                        calc(n)= 1-(((1-conjuntoDeAvaliacoesVetorizadoMedio(m, f, 1))^peso(1))*((1-conjuntoDeAvaliacoesVetorizadoMedio(j, f, 2))^peso(2))*((1-conjuntoDeAvaliacoesVetorizadoMedio(k, f, 3))^peso(3))*((1-conjuntoDeAvaliacoesVetorizadoMedio(t, f, 4))^peso(4)));
                        soma=soma+1;
                        result=result+calc(n);

                        
                     end
                    
                                                          
                    n=n+1;
                end
            end
        end     
    end   
    
       if soma == 0
                            
            soma = 1;
            
       end
                        

    HFWAMedio(f) =result/soma;
    

  end 
 
 %%%%%%%%%%%% agregacao para o termo alto do numero triangular %%%%% 
 
    for f=1: qtidadeLinhas  
      
     n=1;
     result = 0;
     soma=0;

    for t=1:5
       for k=1:5
            for j=1:5
                for m=1:5
                    
                     if conjuntoDeAvaliacoesVetorizado2(m, f, 1)==1 && conjuntoDeAvaliacoesVetorizado2(j, f, 2)==1 && conjuntoDeAvaliacoesVetorizado2(k, f, 3)==1   && conjuntoDeAvaliacoesVetorizado2(t, f, 4)==1                
                        
                        calc(n)= 1-(((1-conjuntoDeAvaliacoesVetorizadoAlto(m, f, 1))^peso(1))*((1-conjuntoDeAvaliacoesVetorizadoAlto(j, f, 2))^peso(2))*((1-conjuntoDeAvaliacoesVetorizadoAlto(k, f, 3))^peso(3))*((1-conjuntoDeAvaliacoesVetorizadoAlto(t, f, 4))^peso(4)));
                        
                        soma=soma+1;
                        result=result+calc(n);
                        
                        

                        
                    end
                    
                                                          
                    n=n+1;
                end
            end
        end     
    end   
    
       if soma == 0
                            
            soma = 1;
            
       end
                        

    HFWAAlto(f) =result/soma;
    

  end 
 

    %%%%%%%%%%%%%% Defuzzificação da agregação %%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i =1:qtidadeLinhas  
    
agregacao(i, 1) = (HFWABaixo(i) + (2*HFWAMedio(i)) + HFWAAlto(i))/4;

end

 %%%%%%%%%%%%%% Defuzzificação dos inputs iniciais %%%%%%%%%%%%%%%%%%%%%%%%%%%%

LinhaColuna = size(linguisticJudgments); %retorna numero de linhas e colunas da matriz de avaliacoes
qtidadeLinhas = LinhaColuna(1);
qtidadeColunas = LinhaColuna(2);


for k = 1:qtidadeLinhas

 

%%%% Converção das avaliacoes %%%%%%%%%%%%%

conjuntoDeAvaliacoesVetorizado = zeros(5,qtidadeLinhas,qtidadeColunas);

for i = 1:qtidadeLinhas
    for j = 1:qtidadeColunas
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if strcmp(linguisticJudgments(i,j),'VL') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = VL;

        end
        
        if strcmp(linguisticJudgments(i,j),'L') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = L;

        end
        
        if strcmp(linguisticJudgments(i,j),'M') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = M;

        end   
        
        if strcmp(linguisticJudgments(i,j),'H') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = H;

        end
        
        if strcmp(linguisticJudgments(i,j),'VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = VH;

        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        if strcmp(linguisticJudgments(i,j),'H-VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (H+VH)/2;

        end        
        
        if strcmp(linguisticJudgments(i,j),'M-VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (M+H+VH)/3;

        end        
        
        if strcmp(linguisticJudgments(i,j),'L-VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (L+M+H+VH)/4;

        end
        
        if strcmp(linguisticJudgments(i,j),'VL-VH') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (VL+L+M+H+VH)/5;

        end    
        
        if strcmp(linguisticJudgments(i,j),'M-H') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (M+H)/2;

        end
        
        if strcmp(linguisticJudgments(i,j),'L-H') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (L+M+H)/3;

        end        
        
        if strcmp(linguisticJudgments(i,j),'VL-H') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (VL+L+M+H)/4;

        end    
        
        if strcmp(linguisticJudgments(i,j),'L-M') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (L+M)/2;

        end        

        if strcmp(linguisticJudgments(i,j),'VL-M') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (VL+L+M)/3;

        end          

        if strcmp(linguisticJudgments(i,j),'VL-L') == 1;
            

            conjuntoDeAvaliacoesVetorizado(1:5, i, j) = (VL+L)/2;

        end          
      
        
    end

end


    


 end



%%%%%%%%%%%%% Agregacao %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
 %%%%%%%% Convertendo avaliacoes para 1 ou 0 se o termo é ativado ou não %%
 
 
 for k = 1:5
    for i = 1:qtidadeLinhas
        for j = 1:qtidadeColunas
        
        
            if conjuntoDeAvaliacoesVetorizado(k, i, j) > 0
                
                conjuntoDeAvaliacoesVetorizado2(k, i, j)   = 1; 
 
            end
 
        end
    end
 end
 

 %%%%%% leitura para apenas os termos mais baixos %%%%%%
 
conjuntoDeAvaliacoesVetorizadoBaixo = zeros(5, qtidadeLinhas, qtidadeColunas);


for i = 1:qtidadeLinhas
    for j = 1:qtidadeColunas

conjuntoDeAvaliacoesVetorizadoBaixo(1:5, i, j) = [  0*conjuntoDeAvaliacoesVetorizado2(1, i, j)         0*conjuntoDeAvaliacoesVetorizado2(2, i, j)     0.25*conjuntoDeAvaliacoesVetorizado2(3, i, j)      0.5*conjuntoDeAvaliacoesVetorizado2(4, i, j)         0.75*conjuntoDeAvaliacoesVetorizado2(5, i, j) ];
 
    end
end

 %%%%%% leitura para apenas os termos medios %%%%%%
 
conjuntoDeAvaliacoesVetorizadoMedio = zeros(5, qtidadeLinhas, qtidadeColunas);


for i = 1:qtidadeLinhas
    for j = 1:qtidadeColunas

conjuntoDeAvaliacoesVetorizadoMedio(1:5, i, j) = [  0*conjuntoDeAvaliacoesVetorizado2(1, i, j)         0.25*conjuntoDeAvaliacoesVetorizado2(2, i, j)     0.50*conjuntoDeAvaliacoesVetorizado2(3, i, j)      0.75*conjuntoDeAvaliacoesVetorizado2(4, i, j)         1.0*conjuntoDeAvaliacoesVetorizado2(5, i, j) ];
 
    end
end


 %%%%%% leitura para apenas os termos mais altos %%%%%%
 
conjuntoDeAvaliacoesVetorizadoAlto = zeros(5, qtidadeLinhas, qtidadeColunas);


for i = 1:qtidadeLinhas
    for j = 1:qtidadeColunas

conjuntoDeAvaliacoesVetorizadoAlto(1:5, i, j) = [  0.25*conjuntoDeAvaliacoesVetorizado2(1, i, j)         0.50*conjuntoDeAvaliacoesVetorizado2(2, i, j)     0.75*conjuntoDeAvaliacoesVetorizado2(3, i, j)      1.0*conjuntoDeAvaliacoesVetorizado2(4, i, j)         1.0*conjuntoDeAvaliacoesVetorizado2(5, i, j) ];
 
    end
end

%%%%%%%%%%%% agregacao para o termo mais baixo do numero triangular %%            

peso(1)= 0.25;
peso(2)= 0.25;
peso(3)= 0.25;
peso(4)= 0.25;

agregacaoSomaBaixo = zeros(qtidadeLinhas, qtidadeColunas);
agregacaoBaixo = zeros(qtidadeLinhas, qtidadeColunas);
n = 0;

for i=1:qtidadeLinhas 
    
    agregacaoBaixo(i, j) = 0;
    
   for j=1:qtidadeColunas 
       
       n = 0;
       agregacaoBaixo(i, j) = 0;
       
       for k = 1:5  
        if conjuntoDeAvaliacoesVetorizado2(k, i, j)==1
            
            
        agregacaoSomaBaixo(i, j) = agregacaoSomaBaixo(i, j) + conjuntoDeAvaliacoesVetorizadoBaixo(k, i, j);
        n = n+ 1;
            
        end 
        
       end
       
       agregacaoBaixo(i, j) = agregacaoSomaBaixo(i, j)/n;
       
   end
   
end

agregacaoSomaMedio = zeros(qtidadeLinhas, qtidadeColunas);
agregacaoMedio = zeros(qtidadeLinhas, qtidadeColunas);
n = 0;

for i=1:qtidadeLinhas 
    
    agregacaoMedio(i, j) = 0;
    
   for j=1:qtidadeColunas 
       
       n = 0;
       agregacaoMedio(i, j) = 0;
       
       for k = 1:5  
        if conjuntoDeAvaliacoesVetorizado2(k, i, j)==1
            
            
        agregacaoSomaMedio(i, j) = agregacaoSomaMedio(i, j) + conjuntoDeAvaliacoesVetorizadoMedio(k, i, j);
        n = n+ 1;
            
        end 
        
       end
       
       agregacaoMedio(i, j) = agregacaoSomaMedio(i, j)/n;
       
   end
   
end


agregacaoSomaAlto = zeros(qtidadeLinhas, qtidadeColunas);
agregacaoAlto = zeros(qtidadeLinhas, qtidadeColunas);


for i=1:qtidadeLinhas 
    
    agregacaoAlto(i, j) = 0;
    
   for j=1:qtidadeColunas 
       
       agregacaoAlto(i, j) = 0;
       n = 0;
       
       for k = 1:5  
        if conjuntoDeAvaliacoesVetorizado2(k, i, j)==1
            
            
        agregacaoSomaAlto(i, j) = agregacaoSomaAlto(i, j) + conjuntoDeAvaliacoesVetorizadoAlto(k, i, j);
        n = n+ 1;
            
        end 
        
       end
       
       agregacaoAlto(i, j) = agregacaoSomaAlto(i, j)/n;
       
   end
   
end


for i=1:qtidadeLinhas 
    
    defuzzyficado(i, j) = 0;
    
    for j=1:qtidadeColunas 
    
        defuzzyficado(i, j) = (agregacaoBaixo(i, j) + (2*agregacaoMedio(i, j)) + agregacaoAlto(i, j))/4;


    end
    
end
     

%%%% data 1
totalData = [defuzzyficado agregacao];

% %%%% data 2
% random_totalData = totalData(randperm(size(totalData, 1)), :);
% totalData = random_totalData;
% 
% %%%% data 3
% random_totalData = totalData(randperm(size(totalData, 1)), :);
% totalData = random_totalData;
% 
% 
% %%%% data 4
% random_totalData = totalData(randperm(size(totalData, 1)), :);
% totalData = random_totalData;
%  
% %%%% data 5
% random_totalData = totalData(randperm(size(totalData, 1)), :);
% totalData = random_totalData;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dataEdu = totalData(1:210, :);
dataTest = totalData(211:300, :);
dataOutput = totalData(:, 1:end-1);

% amostra(:, 2:end) = conjuntoDeTreinamento(:, 1:end-1);

disp('fim')

% 
% m3333Output = evalfis(dataOutput, m3333)