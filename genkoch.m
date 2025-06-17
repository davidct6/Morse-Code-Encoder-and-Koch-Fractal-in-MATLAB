function M = genkoch(n, Patt, M0)

    M = M0; %Curva inicial
    
    % Iterem n ordre
    for k = 1:n
        numSegments = size(M, 2) - 1;  %Nombre de punts
        newPoints = zeros(2, numSegments * (size(Patt, 2) - 1) + 1);  
        
        idx = 1;
        
        % Loop per cada segment
        for i = 1:numSegments
            x0 = M(1, i);    % Start point x
            y0 = M(2, i);    % Start point y
            x1 = M(1, i+1);  % End point x
            y1 = M(2, i+1);  % End point y

            % Calculate the direction and length of the current segment
            dx = (x1 - x0) / 3;
            dy = (y1 - y0) / 3;

            % Generate the three new points dividing the segment
            xA = x0 + dx;   yA = y0 + dy;   
            xC = x0 + 2 * dx; yC = y0 + 2 * dy; 

          
            xB = (xA + xC) / 2 - sqrt(3) * (yC - yA) / 2;
            yB = (yA + yC) / 2 + sqrt(3) * (xC - xA) / 2;

            
            newPoints(:, idx)   = [x0; y0];
            newPoints(:, idx+1) = [xA; yA];
            newPoints(:, idx+2) = [xB; yB];
            newPoints(:, idx+3) = [xC; yC];
            idx = idx + 4;
        end


        newPoints(:, idx) = [x1; y1];
        M = newPoints;  
    end

    % Plot
    figure;
    plot(M(1, :), M(2, :), 'k', 'LineWidth', 1);
    axis equal;
    axis off;
end
