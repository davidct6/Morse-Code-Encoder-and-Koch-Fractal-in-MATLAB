function M = koch(n)

    M = [0, 1; 0, 0];  

    for k = 1:n
        numSegments = size(M,2) - 1;
        newPoints = zeros(2, numSegments * 4 + 1);

        idx = 1;
        for i = 1:numSegments
           
            x0 = M(1, i);
            y0 = M(2, i);

            x1 = M(1, i+1);
            y1 = M(2, i+1);

            dx = (x1 - x0) / 3;
            dy = (y1 - y0) / 3;

            xA = x0 + dx;   
            yA = y0 + dy;

            xC = x0 + 2*dx; 
            yC = y0 + 2*dy;

            % Rotació de 60 graus
            xB = (xA + xC) / 2 - sqrt(3) * (yC - yA) / 2;
            yB = (yA + yC) / 2 + sqrt(3) * (xC - xA) / 2;

            newPoints(:, idx)   = [x0; y0];
            newPoints(:, idx+1) = [xA; yA];
            newPoints(:, idx+2) = [xB; yB];
            newPoints(:, idx+3) = [xC; yC];
            idx = idx + 4;
        end

        % Punt final
        newPoints(:, end) = [x1; y1];

        M = newPoints;
    end

    % Plot
    figure;
    plot(M(1,:), M(2,:), 'k', 'LineWidth', 1);
    axis equal;
    axis off;
end
