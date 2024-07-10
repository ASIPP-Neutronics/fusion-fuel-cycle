[Openmodelica]
    [tep]
        T = 2
        loss = 0.0005
        epsilon = 0.0001
        from = vp
        to = iss
    []
    [tes]
        T = 12
        loss = 0.01
    []
    [iss]
        T = 6
        loss = 0.00005
    []
    [plasma]
        burning_fraction = 0.03
        fueling_effiency = 0.8
    []
    [cps]
        T = 24
        loss = 0.01
    []
    [pump]
        T = 2
        loss = 0.001
    []
[]