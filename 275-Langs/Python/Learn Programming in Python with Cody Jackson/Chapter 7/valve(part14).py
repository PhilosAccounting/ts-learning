    globe1 = Globe("\nThrottle valve", flow_coeff=21, press_in=10, sys_flow_in=15)
    print("{} created".format(globe1.name))
    print(globe1.read_position())
    globe1.open()
    print(globe1.read_position())
    globe1.close()
    print(globe1.read_position())
    globe1.turn_handle(40)
    print(globe1.read_position())
