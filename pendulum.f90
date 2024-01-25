program pendulum_simulation
    implicit none

    ! Deklaracija varijabli
    real :: theta_h, theta_m, v_h, v_m, g, L, dt, time
    real :: input_angle_h, input_angle_m
    integer :: i, n

    ! Inicijalizacija varijabli
    g = 9.81
    L = 1.0
    dt = 0.01 ! promjena vremena u koraku
    n = 1000  ! broj vremenski koraka

    ! početne brzine njihala
    v_h = 0.0
    v_m = 0.0

    ! Korisnik unosi početni kut, limitiran od 0 do 180 stupnjeva
    ! Unos se poslije pretvara u radijane, unos u stupnjevima je radi lakše vizualizacije otklona

    print *, 'Unesite početni kut harmonijskog njihala u stupnjevima (0 to 180):'
    read *, input_angle_h
    do while ((input_angle_h < 0.0) .or. (input_angle_h > 180.0))
        print *, 'Krivi unos. Molimo unesite broj između 0 i 180:'
        read *, input_angle_h
    end do

    print *, 'Unesite početni kut harmonijskog njihala u stupnjevima (0 to 180):'
    read *, input_angle_m
    do while ((input_angle_m < 0.0) .or. (input_angle_m > 180.0))
        print *, 'Krivi unos. Molimo unesite broj između 0 i 180:'
        read *, input_angle_m
    end do

    ! pretvaramo u radijane
    theta_h = input_angle_h * 3.14159265359 / 180.0
    theta_m = input_angle_m * 3.14159265359 / 180.0

    open(unit=10, file='pendulum_data.txt', status='unknown')

    ! simulacija njihala
    do i = 1, n
        time = i * dt

        ! vremenski korak harmonijskog njihala
        theta_h = theta_h + v_h * dt
        v_h = v_h - (g / L) * theta_h * dt

        ! vremenski korak matematičkog njihala
        theta_m = theta_m + v_m * dt
        v_m = v_m - (g / L) * sin(theta_m) * dt

        ! rezultate pišemo u datoteku
        write(10, *) time, theta_h, theta_m
    end do

    close(10)
end program pendulum_simulation
