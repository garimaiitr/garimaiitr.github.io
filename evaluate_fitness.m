 

function pop = evaluate_fitness(pop, problem, k, ncon)
%import org.apache.xmlrpc.client.*
% connect to 20-sim
%N=zeros( pop,'gpuArray');
N = size(pop,1);
%x=zeros( N,k);
x = pop(1:N, 1:k);
f = zeros(N);
%c = zeros(1:N,1:k);
 parfor i=1:N
    xxsimConnect('http://localhost:5580',1.79e308);
    %xxsimConnect();
   % pop(i, k+1 : k+1+1) = true_func( x(i,1:k), problem, ncon );
    f(i) = true_func( x(i,1:k), problem, ncon );
    
     
% end   

%x = pop(1:N, 1:k);
%f = zeros(N);
%c = zeros(N);
 
%for i=1:N
   
%     FuzzyType2; 
 %xxsimConnect('http://localhost:5580',3600);
   % f(i), c(i) = true_func( x(i,1:k),problem, ncon );
     %disp(['>>> f: ' num2str(f(i))]);
    %evalin('base', 'load(''C:\Users\GARIMA\Documents\Scripting\Octave\tutorials\9_link_snake_01-03-2021distb(type2-robust).emx'')')
    %xxsimConnect('http://localhost:5580',3600)
   
 end 
%pop = zeros(N, k+1+1,'gpuArray'); 
pop(1:N,k+1:k+2) = f(1:N,1:2);
%disp(['>>> pop: ' num2str( pop(1:N,k+1:k+2))]);
%pop(1:N,k+2:k+2) = c(1:N);

end

