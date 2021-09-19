function [] = election_party(n,k,N)

% Population 3D matriX
Population = zeros(n,n,3);

% each layer of matrix fill with 0 or 1 so that union of thease 3 2D matriX
% is ones(n,n) but they don't have intersectoin
Population(:,:,1) = ceil(rand(n,n)*3);

Population(:,:,2) = ~mod(Population(:,:,1) + 1,3);
Population(:,:,3) = ~mod(Population(:,:,1) + 2,3);
Population(:,:,1) = ~mod(Population(:,:,1),3);

imagesc(Population);

% stop time in each turn that decrease exponential ( p = 0.99 ) so it moves
% slow at the beginning 
Stop_time = 0.4; 

for i = 1:N
    
    % selcting 1/k of nodes randomly
    tmp = 2*ceil((n*n)/k);
    Tmp = ceil(rand(tmp,1)*n);
    
    for j = 1:2:size(Tmp,1)
        
        % Selecting randomly one of the neighbors
        x = min(n, max(1, Tmp(j) + (randi(3) - 2)));
        y = min(n, max(1, Tmp(j+1) + (randi(3) - 2)));
        
        % Our selected neighbor should not been as same as our node
        while (x == Tmp(j) && y == Tmp(j+1))
             x = min(n, max(1, Tmp(j) + (randi(3) - 2)));
            y = min(n, max(1, Tmp(j+1) + (randi(3) - 2)));
        end
        
        Population(Tmp(j),Tmp(j+1),:) = Population(x,y,:);
        
    end
    
    % Ploting
    h = imagesc(Population);
    title(['N = ', num2str(i)]);
    pause(Stop_time);
    Stop_time = 0.99.*Stop_time;
    
    % Part that end the progress when we close the plot window
    if ~isvalid(h)
        break;    
    end
    
end

end

