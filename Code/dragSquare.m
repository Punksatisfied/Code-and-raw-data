function colorSquare()
    figure;
    h = rectangle('Position', [0 0 1 1], 'FaceColor', 'black');

    set(gcf, 'WindowKeyPressFcn', @keypressCallback);

    function keypressCallback(src, event)
        key = event.Key;
        switch key
            case 'q'
                set(h, 'FaceColor', 'red');
                title('前进蠕动');
            case 'w'
                set(h, 'FaceColor', 'green');
                title('后退蠕动');
            case 'e'
                set(h, 'FaceColor', 'blue');
                title('头动');
            case 'r'
                set(h, 'FaceColor', 'yellow');
                title('缩尾');
                            case 'd'
                set(h, 'FaceColor', 'black');
                title('静止');
                            case 'f'
                set(h, 'FaceColor', 'white');
                title('全身紧张');
        end
    end
end
