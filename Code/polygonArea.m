function area = polygonArea(points)
    % points: N×2 的点集合 (x, y)
    x = points(:, 1);
    y = points(:, 2);
    area = 0.5 * abs(sum(x .* circshift(y, -1)) - sum(y .* circshift(x, -1)));
end
