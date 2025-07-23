function colorSquare()
    figure;
    h = rectangle('Position', [0 0 1 1], 'FaceColor', 'black');

    set(gcf, 'WindowKeyPressFcn', @keypressCallback);

    function keypressCallback(src, event)
        key = event.Key;
        switch key
            case 'q'
                set(h, 'FaceColor', 'red');
                title('FWD');
            case 'w'
                set(h, 'FaceColor', 'green');
                title('BWD');
            case 'e'
                set(h, 'FaceColor', 'blue');
                title('HEAD');
            case 'r'
                set(h, 'FaceColor', 'yellow');
                title('TAIL');
                            case 'd'
                set(h, 'FaceColor', 'black');
                title('STATIC');
                            case 'f'
                set(h, 'FaceColor', 'white');
                title('UNknown');
        end
    end
end
