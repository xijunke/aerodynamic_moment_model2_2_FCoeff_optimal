%% optimal_aeroF_coeff
tic
matlabpool open 4
% function obj_function=objfunction_aeroF_coeff(x)
ObjFunction=@objfunction_aeroF_stdev;  % fitness and constraint functions——调用目标函数objfunction_aeroF_coeff
nvars=4;   % Number of variables 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%Call hybrid-ga——混合遗传算法
% options=gaoptimset('Display','diagnose','Display','iter','StallTimeLimit',7200,'PopulationSize',100,...
%                'PlotFcns',{@gaplotbestf,@gaplotexpectation,@gaplotstopping,@gaplotbestindiv,@gaplotscores,@gaplotrange},...
%                'UseParallel','always'); %并行计算—可行
% % options=gaoptimset('PopulationSize',100,'PlotFcns',{@gaplotbestf,@gaplotmaxconstr},'UseParallel','always'); %并行计算可行 % 20150407
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % fminsearchoptions = optimset('Display','iter','MaxFunEvals',1000,'MaxIter',1000,'TolCon',1e-6,'TolFun',1e-6,'UseParallel','always');
% % 'Display','notify-detailed'
% fminsearchoptions = optimset('Display','iter-detailed','MaxFunEvals',1000,'MaxIter',1000,'TolCon',1e-15,'TolFun',1e-15,'UseParallel','always');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% options =gaoptimset(options,'Hybridfcn',{@fminsearch,fminsearchoptions});
% [x,fval,exitflag,output,population,scores]=ga(ObjFunction,nvars,[],[],[],[],[],[],[],options)
% matlabpool close
% toc
% %
% output_1=[population,scores];
% xlswrite('D:\KXJ\hybrid_GA_fminsearch_WingM4_4\population_scores.xlsx',output_1,'sheet1','A1:J100');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Call patternsearch——模式搜索
x0=[1,1,1,1];  % stdev =41.7446;
% psoptimset——Create pattern search options structure
% % Complete poll around current iterate; 'off'
% options=psoptimset('CompletePoll','on','CompleteSearch','on','Display','iter','UseParallel','always'); 
options=psoptimset('CompletePoll','on','CompleteSearch','on','TolCon',1e-15,'TolFun',1e-15,'UseParallel','always'); 
% [x,fval,exitflag,output] = patternsearch(ObjFunction,x0,[],[],[],[],[],[],[],options)
[x,fval] = patternsearch(ObjFunction,x0,[],[],[],[],[],[],[],options);
matlabpool close
% result=[x,fval];
save('result_x.txt', 'x', '-ASCII')
save('result_fval.txt', 'fval', '-ASCII')
% toc;
elapsedTime =toc;  % Caculation finished and the elapsedTime= 52.1632;
disp(['Caculation finished and the elapsedTime= ' num2str(elapsedTime ,'%5.4f')])
%   fprintf ( 1, 'A=x^2+y^2+a+b=  %3.6f\n' ,A);
%   fprintf ( 1, '  Hello, world!\n' );

% quit


% %
% output_1=[population,scores];
% xlswrite('D:\KXJ\hybrid_GA_fminsearch_WingM4_4\population_scores.xlsx',output_1,'sheet1','A1:J100');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
