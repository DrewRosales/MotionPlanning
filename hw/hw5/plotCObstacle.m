function h = plotCObstacle(CB_theta, i)
    if size(CB_theta, 2) < 3
        error('CB_theta must have at least 3 vertices.');
    end
    if ~isscalar(i) || i <= 0 || round(i) ~= i
        error('i must be a positive integer.');
    end
    
    h = patch('XData', CB_theta(1,:), 'YData', CB_theta(2,:), 'FaceColor', 'green', 'EdgeColor', 'black');
    
    centroid = mean(CB_theta, 2);
    text(centroid(1), centroid(2), sprintf('CB %d', i), 'HorizontalAlignment', 'center', 'FontSize', 12, 'FontWeight', 'bold');
    
    axis equal;
    hold on;
end