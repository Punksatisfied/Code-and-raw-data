function connect2motor(device,x)
try
    write(device, x+char(13)+char(10), "char");
catch
    disp("wrong")
end
end