function fi = XP_System(t,xi)
    miu = 0.012277471;
    miu_hat = 1-miu;
    fi = zeros(4,1);
    fi(1) = xi(2);
    fi(2) = xi(1)+2*xi(4)-miu_hat*(xi(1)+miu)/((xi(1)+miu)^2+xi(3)^2)^(3/2)-miu*(xi(1)-miu_hat)/((xi(1)-miu_hat)^2+xi(3)^2)^(3/2);
    fi(3) = xi(4);
    fi(4) = xi(3)-2*xi(2)-miu_hat*xi(3)/((xi(1)+miu)^2+xi(3)^2)^(3/2)-miu*xi(3)/((xi(1)-miu_hat)^2+xi(3)^2)^(3/2);
end