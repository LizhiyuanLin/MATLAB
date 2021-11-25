function category = classifypoints(file, points)
    load(file);
    [~,num_of_points] = size(points);
    category = zeros(1, num_of_points);
    for i = 1:num_of_points
         x = points(i);
         a2 = activate(x,W2,b2);
         a3 = activate(a2,W3,b3);
         a4 = activate(a3,W4,b4);
         if a4(1) >= a4(2)
             category(i) = 1;
         end
     end
end