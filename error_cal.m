% calculate absolute error
function err = error_cal (actual,aprox)

a1 = size(actual);
err = zeros(1,a1(2));
for i = 1: a1(2)
    err(i) = abs(actual(i)-aprox(i));
end